library(SentimentAnalysis)


### Name: summary.SentimentDictionaryWordlist
### Title: Output summary information on sentiment dictionary
### Aliases: summary.SentimentDictionaryWordlist
###   summary.SentimentDictionaryBinary summary.SentimentDictionaryWeighted
### Keywords: dictionary

### ** Examples

summary(SentimentDictionary(c("uncertain", "possible", "likely")))
summary(SentimentDictionary(c("increase", "rise", "more"),
                            c("fall", "drop")))
summary(SentimentDictionary(c("increase", "decrease", "exit"),
                            c(+1, -1, -10),
                            rep(NA, 3)))



