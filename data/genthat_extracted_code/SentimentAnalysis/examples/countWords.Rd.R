library(SentimentAnalysis)


### Name: countWords
### Title: Count words
### Aliases: countWords countWords.Corpus countWords.character
###   countWords.data.frame countWords.TermDocumentMatrix
###   countWords.DocumentTermMatrix

### ** Examples

documents <- c("This is a test", "an one more")

# count words (without stopwords)
countWords(documents)

# count all words (including stopwords)
countWords(documents, removeStopwords=FALSE)



