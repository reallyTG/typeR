library(SentimentAnalysis)


### Name: analyzeSentiment
### Title: Sentiment analysis
### Aliases: analyzeSentiment analyzeSentiment.Corpus
###   analyzeSentiment.character analyzeSentiment.data.frame
###   analyzeSentiment.TermDocumentMatrix
###   analyzeSentiment.DocumentTermMatrix
### Keywords: sentiment

### ** Examples

## Not run: 
##D library(tm)
##D 
##D # via vector of strings
##D corpus <- c("Positive text", "Neutral but uncertain text", "Negative text")
##D sentiment <- analyzeSentiment(corpus)
##D compareToResponse(sentiment, c(+1, 0, -2))
##D 
##D # via Corpus from tm package
##D data("crude")
##D sentiment <- analyzeSentiment(crude)
##D     
##D # via DocumentTermMatrix (with stemmed entries)
##D dtm <- DocumentTermMatrix(VCorpus(VectorSource(c("posit posit", "negat neutral")))) 
##D sentiment <- analyzeSentiment(dtm)
##D compareToResponse(sentiment, convertToBinaryResponse(c(+1, -1)))
##D 
##D # By adapting the parameter rules, one can incorporate customized dictionaries
##D # e.g. in order to adapt to arbitrary languages
##D dictionaryAmplifiers <- SentimentDictionary(c("more", "much"))
##D sentiment <- analyzeSentiment(corpus,
##D                               rules=list("Amplifiers"=list(ruleRatio,
##D                                                            dictionaryAmplifiers)))
##D                                                            
##D # On can also restrict the number of computed methods to the ones of interest
##D # in order to achieve performance optimizations
##D sentiment <- analyzeSentiment(corpus,
##D                               rules=list("SentimentLM"=list(ruleSentiment, 
##D                                                             loadDictionaryLM())))
##D sentiment
## End(Not run)




