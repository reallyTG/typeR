library(nsRFA)


### Name: hydroSIMN
### Title: Data-sample
### Aliases: hydroSIMN annualflows parameters meanmonthlyflows monthlyflows
### Keywords: datasets

### ** Examples

data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,] 
split(x,cod)
sapply(split(x,cod),mean)
sapply(split(x,cod),median)
sapply(split(x,cod),quantile)
sapply(split(x,cod),Lmoments)

parameters



