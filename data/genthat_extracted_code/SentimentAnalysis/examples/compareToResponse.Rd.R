library(SentimentAnalysis)


### Name: compareToResponse
### Title: Compare sentiment values to existing response variable
### Aliases: compareToResponse compareToResponse.logical
###   compareToResponse.factor compareToResponse.integer
###   compareToResponse.data.frame compareToResponse.numeric
### Keywords: evaluation

### ** Examples

sentiment <- matrix(c(5.5, 2.9, 0.9, -1), 
                    dimnames=list(c("A", "B", "C", "D"), c("Sentiment")))

# continuous numeric response variable
response <- c(5, 3, 1, -1)
compareToResponse(sentiment, response)

# binary response variable
response <- c(TRUE, TRUE, FALSE, FALSE)
compareToResponse(sentiment, response)



