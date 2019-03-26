library(tm)


### Name: removeWords
### Title: Remove Words from a Text Document
### Aliases: removeWords removeWords.character
###   removeWords.PlainTextDocument

### ** Examples

data("crude")
crude[[1]]
removeWords(crude[[1]], stopwords("english"))



