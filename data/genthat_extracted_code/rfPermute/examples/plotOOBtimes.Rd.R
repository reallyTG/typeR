library(rfPermute)


### Name: plotOOBtimes
### Title: Plot Times OOB
### Aliases: plotOOBtimes

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotOOBtimes(rf)




