library(SentimentAnalysis)


### Name: generateDictionary
### Title: Generates dictionary of decisive terms
### Aliases: generateDictionary generateDictionary.Corpus
###   generateDictionary.character generateDictionary.data.frame
###   generateDictionary.TermDocumentMatrix
###   generateDictionary.DocumentTermMatrix
### Keywords: dictionary evaluation sentiment

### ** Examples

# Create a vector of strings
documents <- c("This is a good thing!",
               "This is a very good thing!",
               "This is okay.",
               "This is a bad thing.",
               "This is a very bad thing.")
response <- c(1, 0.5, 0, -0.5, -1)

# Generate dictionary with LASSO regularization
dictionary <- generateDictionary(documents, response)

# Show dictionary
dictionary
summary(dictionary)
plot(dictionary)

# Compute in-sample performance
sentiment <- predict(dictionary, documents)
compareToResponse(sentiment, response)
plotSentimentResponse(sentiment, response)

# Generate new dictionary with spike-and-slab regression instead of LASSO regularization
library(spikeslab)
dictionary <- generateDictionary(documents, response, modelType="spikeslab")

# Generate new dictionary with tf weighting instead of tf-idf

library(tm)
dictionary <- generateDictionary(documents, response, weighting=weightTf)
sentiment <- predict(dictionary, documents)
compareToResponse(sentiment, response)

# Use instead lambda.min from the LASSO estimation
dictionary <- generateDictionary(documents, response, control=list(s="lambda.min"))
sentiment <- predict(dictionary, documents)
compareToResponse(sentiment, response)

# Use instead OLS as estimation method
dictionary <- generateDictionary(documents, response, modelType="lm")
sentiment <- predict(dictionary, documents)
sentiment

dictionary <- generateDictionary(documents, response, modelType="lm", 
                                 filterTerms = c("good", "bad"))
sentiment <- predict(dictionary, documents)
sentiment

dictionary <- generateDictionary(documents, response, modelType="lm", 
                                 filterTerms = extractWords(loadDictionaryGI()))
sentiment <- predict(dictionary, documents)
sentiment

# Generate dictionary without LASSO intercept
dictionary <- generateDictionary(documents, response, intercept=FALSE)
dictionary$intercept
 
## Not run: 
##D imdb <- loadImdb()
##D 
##D # Generate Dictionary
##D dictionary_imdb <- generateDictionary(imdb$Corpus, imdb$Rating, family="poisson")
##D summary(dictionary_imdb)
##D 
##D compareDictionaries(dictionary_imdb,
##D                     loadDictionaryGI())
##D                     
##D # Show estimated coefficients with Kernel Density Estimation (KDE)
##D plot(dictionary_imdb)
##D plot(dictionary_imdb) + xlim(c(-0.1, 0.1))
##D 
##D # Compute in-sample performance
##D pred_sentiment <- predict(dict_imdb, imdb$Corpus)
##D compareToResponse(pred_sentiment, imdb$Rating)
##D 
##D # Test a different sparsity parameter
##D dictionary_imdb <- generateDictionary(imdb$Corpus, imdb$Rating, family="poisson", sparsity=0.99)
##D summary(dictionary_imdb)
##D pred_sentiment <- predict(dict_imdb, imdb$Corpus)
##D compareToResponse(pred_sentiment, imdb$Rating)
## End(Not run)



