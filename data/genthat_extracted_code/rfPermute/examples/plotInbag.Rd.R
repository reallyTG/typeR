library(rfPermute)


### Name: plotInbag
### Title: Plot inbag distribution
### Aliases: plotInbag

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotInbag(rf)




