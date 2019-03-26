library(scoring)


### Name: logscore
### Title: Calculate Logarithmic Scores
### Aliases: logscore

### ** Examples

data("WorldEvents")
## Raw log scores (0 best, infinity worst)
log1 <- logscore(answer ~ forecast, data=WorldEvents)
## Raw log scores (0 best, -infinity worst)
log1 <- logscore(answer ~ forecast, data=WorldEvents,
                 reverse = TRUE)
## Raw log scores plus group means
log2 <- logscore(answer ~ forecast, data=WorldEvents,
                 group="forecaster")



