library(SentimentAnalysis)


### Name: plotSentimentResponse
### Title: Scatterplot with trend line between sentiment and response
### Aliases: plotSentimentResponse
### Keywords: evaluation plots

### ** Examples

sentiment <- data.frame(Dictionary=runif(10))
response <- sentiment[[1]] + rnorm(10)

plotSentimentResponse(sentiment, response)

# Change x-axis
plotSentimentResponse(sentiment, response, xlab="Tone")

library(ggplot2)
# Extend plot with additional layout options
plotSentimentResponse(sentiment, response) + ggtitle("Scatterplot")
plotSentimentResponse(sentiment, response) + theme_void() 



