library(SentimentAnalysis)


### Name: extractWords
### Title: Extract words from dictionary
### Aliases: extractWords
### Keywords: dictionary

### ** Examples

extractWords(SentimentDictionary(c("uncertain", "possible", "likely"))) # returns 3
extractWords(SentimentDictionary(c("increase", "rise", "more"),
                                 c("fall", "drop"))) # returns 5
extractWords(SentimentDictionary(c("increase", "decrease", "exit"),
                                 c(+1, -1, -10),
                                 rep(NA, 3))) # returns 3



