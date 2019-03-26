library(ecospat)


### Name: ecospat.npred
### Title: Number Of Predictors
### Aliases: ecospat.npred

### ** Examples

colvar <- ecospat.testData[c(4:8)]
x <- cor(colvar, method="pearson")
ecospat.npred (x, th=0.75)



