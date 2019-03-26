library(SentimentAnalysis)


### Name: numPositiveEntries
### Title: Number of positive words in dictionary
### Aliases: numPositiveEntries
### Keywords: dictionary

### ** Examples

numPositiveEntries(SentimentDictionary(c("increase", "rise", "more"),
                            c("fall", "drop"))) # returns 3
numPositiveEntries(SentimentDictionary(c("increase", "decrease", "exit"),
                               c(+1, -1, -10),
                               rep(NA, 3))) # returns 1



