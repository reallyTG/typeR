library(nsRFA)


### Name: moments
### Title: Sample moments
### Aliases: moments CV skew kurt
### Keywords: univar

### ** Examples

x <- rnorm(30,10,2)
moments(x)

data(hydroSIMN)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
sapply(split(x,cod),moments)



