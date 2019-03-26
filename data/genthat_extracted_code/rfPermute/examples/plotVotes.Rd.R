library(rfPermute)


### Name: plotVotes
### Title: Vote Distribution
### Aliases: plotVotes

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotVotes(rf)




