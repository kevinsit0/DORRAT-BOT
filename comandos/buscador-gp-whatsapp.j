import { googleImage } from '@bochilteam/scraper'
import fetch from 'node-fetch'
import fs from 'fs'
let handler = async (m, {text, usedPrefix, command, conn}) => {
if (!text) throw `*β οΈ πΈπ½πΆππ΄ππ΄ π΄π» π½πΎπΌπ±ππ΄ π³π΄ π»π° π°πΏπΏ πΎ π°πΏπΊ πππ΄ π³π΄ππ΄π° π±πππ²π°π*`
const res = await googleImage(text)
let image = res.getRandom()
let link = image

let json = await fetch(`https://dhn-api.herokuapp.com/api/search/whatsapp-group?query=${text}&apikey=4709b3d201416e985351`)
let jsons = await json.json()
let caption = `*β RESULTADOSπ*\n`
for (let x of jsons.result) {
caption += `
*β’ π· Nombre:* ${x.data_title}
*β’ π Link:* _${x.data_url}_\nβββ
`}
await conn.reply(m.chat, caption, m)}
handler.tags = ['search']
handler.command = handler.help = ['groupsearch']
handler.register = true
export default handler
