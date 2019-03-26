library(SentimentAnalysis)


### Name: SentimentDictionaryWordlist
### Title: Create a sentiment dictionary consisting of a simple wordlist
### Aliases: SentimentDictionaryWordlist
### Keywords: dictionary

### ** Examples

# generate a dictionary with "uncertainty" words
d <- SentimentDictionaryWordlist(c("uncertain", "possible", "likely"))
summary(d)
# alternative call
d <- SentimentDictionary(c("uncertain", "possible", "likely"))
summary(d)



