library(SentimentAnalysis)


### Name: numNegativeEntries
### Title: Number of negative words in dictionary
### Aliases: numNegativeEntries
### Keywords: dictionary

### ** Examples

numNegativeEntries(SentimentDictionary(c("increase", "rise", "more"),
                            c("fall", "drop"))) # returns 2
numNegativeEntries(SentimentDictionary(c("increase", "decrease", "exit"),
                               c(+1, -1, -10),
                               rep(NA, 3))) # returns 2



