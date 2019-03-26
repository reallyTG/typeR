library(SentimentAnalysis)


### Name: print.SentimentDictionaryWordlist
### Title: Output content of sentiment dictionary
### Aliases: print.SentimentDictionaryWordlist
###   print.SentimentDictionaryBinary print.SentimentDictionaryWeighted
### Keywords: dictionary

### ** Examples

print(SentimentDictionary(c("uncertain", "possible", "likely")))
print(SentimentDictionary(c("increase", "rise", "more"),
                          c("fall", "drop")))
print(SentimentDictionary(c("increase", "decrease", "exit"),
                          c(+1, -1, -10),
                          rep(NA, 3)))



