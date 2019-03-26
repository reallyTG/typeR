library(rfPermute)


### Name: pctCorrect
### Title: Percent Correctly Classified
### Aliases: pctCorrect

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars, importance = TRUE)
pctCorrect(rf)




