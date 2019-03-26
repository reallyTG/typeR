library(SentimentAnalysis)


### Name: SentimentDictionaryBinary
### Title: Create a sentiment dictionary of positive and negative words
### Aliases: SentimentDictionaryBinary
### Keywords: dictionary

### ** Examples

# generate a dictionary with positive and negative words
d <- SentimentDictionaryBinary(c("increase", "rise", "more"),
                               c("fall", "drop"))
summary(d)
# alternative call
d <- SentimentDictionary(c("increase", "rise", "more"),
                         c("fall", "drop"))
summary(d)



