library(KDViz)


### Name: ReplaceByList
### Title: Replace a list of words by another
### Aliases: ReplaceByList
### Keywords: replace words replacement corpus

### ** Examples

data("KDVizData")
wordsToReplace <- system.file("extdata", "KDReplaceWords.txt", package = "KDViz")
myCorpus <- BibToCorpus(bibData = KDVizData, bibUnits = "Keywords",
  controlList = c("stripWhitespace", "removeNumbers"), stopWords = TRUE)

myNewCorpus <- ReplaceByList(myCorpus, wordsFile = wordsToReplace)



