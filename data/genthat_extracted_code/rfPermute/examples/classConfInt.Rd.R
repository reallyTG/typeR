library(rfPermute)


### Name: classConfInt
### Title: Classification Confidence Intervals
### Aliases: classConfInt

### ** Examples

data(symb.metab)

rf <- randomForest(type ~ ., symb.metab)
classConfInt(rf)




