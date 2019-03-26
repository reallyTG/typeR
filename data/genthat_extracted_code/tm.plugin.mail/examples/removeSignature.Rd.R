library(tm.plugin.mail)


### Name: removeSignature
### Title: Remove E-Mail Signatures
### Aliases: removeSignature removeSignature.MailDocument

### ** Examples

require("tm")
newsgroup <- system.file("mails", package = "tm.plugin.mail")
news <- VCorpus(DirSource(newsgroup),
                readerControl = list(reader = readMail))
news[[7]]
removeSignature(news[[7]], marks = "^[+]-*[+]$")



