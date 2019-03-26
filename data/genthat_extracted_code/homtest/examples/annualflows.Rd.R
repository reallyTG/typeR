library(homtest)


### Name: annualflows
### Title: Data-sample
### Aliases: annualflows
### Keywords: datasets

### ** Examples

data(annualflows)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,] 
split(x,cod)
sapply(split(x,cod),mean)
sapply(split(x,cod),median)
sapply(split(x,cod),quantile)
sapply(split(x,cod),Lmoments)



