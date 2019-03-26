library(SentimentAnalysis)


### Name: predict.SentimentDictionaryWeighted
### Title: Prediction for given dictionary
### Aliases: predict.SentimentDictionaryWeighted
### Keywords: dictionary evaluation sentiment

### ** Examples

#' # Create a vector of strings
documents <- c("This is a good thing!",
               "This is a very good thing!",
               "This is okay.",
               "This is a bad thing.",
               "This is a very bad thing.")
response <- c(1, 0.5, 0, -0.5, -1)

# Generate dictionary with LASSO regularization
dictionary <- generateDictionary(documents, response)

# Compute in-sample performance
sentiment <- predict(dictionary, documents)
compareToResponse(sentiment, response)



