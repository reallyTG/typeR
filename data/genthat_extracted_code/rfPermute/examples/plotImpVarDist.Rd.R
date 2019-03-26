library(rfPermute)


### Name: plotImpVarDist
### Title: Plot Important Variable Distribution
### Aliases: plotImpVarDist

### ** Examples

data(mtcars)
df <- mtcars
df$am <- factor(df$am)

rf <- randomForest(am ~ ., df, importance = TRUE)
plotImpVarDist(rf, df, "am")




