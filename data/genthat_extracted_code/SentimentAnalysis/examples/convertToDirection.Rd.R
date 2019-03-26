library(SentimentAnalysis)


### Name: convertToDirection
### Title: Convert continuous sentiment to direction
### Aliases: convertToDirection
### Keywords: evaluation sentiment

### ** Examples

sentiment <- c(-1, -0.5, +1, 0.6, 0)
convertToBinaryResponse(sentiment)
convertToDirection(sentiment)

df <- data.frame(No=1:5, Sentiment=sentiment)
df
convertToBinaryResponse(df)
convertToDirection(df)



