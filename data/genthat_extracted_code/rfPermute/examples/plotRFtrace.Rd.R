library(rfPermute)


### Name: plotRFtrace
### Title: OOB Trace
### Aliases: plotRFtrace

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotRFtrace(rf)




