library(SentimentAnalysis)


### Name: numEntries
### Title: Number of words in dictionary
### Aliases: numEntries
### Keywords: dictionary

### ** Examples

numEntries(SentimentDictionary(c("uncertain", "possible", "likely"))) # returns 3
numEntries(SentimentDictionary(c("increase", "rise", "more"),
                            c("fall", "drop"))) # returns 5
numEntries(SentimentDictionary(c("increase", "decrease", "exit"),
                               c(+1, -1, -10),
                               rep(NA, 3))) # returns 3



