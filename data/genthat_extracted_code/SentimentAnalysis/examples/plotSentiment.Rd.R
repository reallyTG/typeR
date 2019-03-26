library(SentimentAnalysis)


### Name: plotSentiment
### Title: Line plot with sentiment scores
### Aliases: plotSentiment
### Keywords: evaluation plots

### ** Examples

sentiment <- data.frame(Dictionary=runif(20))

plotSentiment(sentiment)
plotSentiment(sentiment, cumsum=TRUE)

# Change name of x-axis
plotSentiment(sentiment, xlab="Tone")

library(ggplot2)
# Extend plot with additional layout options
plotSentiment(sentiment) + ggtitle("Evolving sentiment")
plotSentiment(sentiment) + theme_void() 



