library(SentimentAnalysis)


### Name: SentimentDictionaryWeighted
### Title: Create a sentiment dictionary of words linked to a score
### Aliases: SentimentDictionaryWeighted
### Keywords: dictionary

### ** Examples

# generate dictionary (based on linear model)
d <- SentimentDictionaryWeighted(c("increase", "decrease", "exit"),
                                 c(+1, -1, -10),
                                 rep(NA, 3))
summary(d)
# alternative call
d <- SentimentDictionaryWeighted(c("increase", "decrease", "exit"),
                                 c(+1, -1, -10))
summary(d)
# alternative call
d <- SentimentDictionary(c("increase", "decrease", "exit"),
                         c(+1, -1, -10),
                         rep(NA, 3))
summary(d)                                



