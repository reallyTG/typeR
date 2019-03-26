library(LilRhino)


### Name: Percent
### Title: Percent of confusion matrix
### Aliases: Percent

### ** Examples

true <- rep(1:10, 10)
test <- rep(1:10, 10)
test[c(2, 22, 33, 89)] = 1
Percent(true, test)
#or
#percent(table(true, test))



