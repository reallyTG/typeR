library(KDViz)


### Name: BibToCorpus
### Title: Convert a bibliographic database into a text corpus
### Aliases: BibToCorpus
### Keywords: corpus

### ** Examples

data("KDVizData")
wordsToReplace <- system.file("extdata", "KDReplaceWords.txt", package = "KDViz")
wordsToRemove <- c("analysis", "data", "text", "review", "topic", "theory", "system", "protein")

myCorpus <- BibToCorpus(bibData = KDVizData, bibUnits = "Keywords",
  controlList = c("stripWhitespace", "removeNumbers"), stopWords = TRUE,
  wordsToRemove = wordsToRemove, replaceWords = wordsToReplace)



