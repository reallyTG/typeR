library(tm.plugin.mail)


### Name: readMail
### Title: Read In an E-Mail Document
### Aliases: readMail

### ** Examples

require("tm")
newsgroup <- system.file("mails", package = "tm.plugin.mail")
news <- VCorpus(DirSource(newsgroup),
                readerControl = list(reader = readMail))
inspect(news)



