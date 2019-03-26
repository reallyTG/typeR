library(tm.plugin.mail)


### Name: removeCitation
### Title: Remove E-Mail Citations
### Aliases: removeCitation removeCitation.MailDocument

### ** Examples

require("tm")
newsgroup <- system.file("mails", package = "tm.plugin.mail")
news <- VCorpus(DirSource(newsgroup),
                readerControl = list(reader = readMail))
news[[8]]
removeCitation(news[[8]])
removeCitation(news[[8]], removeQuoteHeader = TRUE)



