library(McSpatial)


### Name: matchqreg
### Title: Sample quantiles and means over time for a matched sample data
###   set
### Aliases: matchqreg
### Keywords: Matching Quantile Regression

### ** Examples

set.seed(189)
n = 500
# sale dates range from 0-10
# mean and variance of x increase over time, from 1 to 2
# price index for y increases from 0 to 1
timesale <- array(0,dim=n)
x <- rnorm(n,0,1)
for (j in seq(1,10)) {
  timesale <- c(timesale, array(j, dim=n))
  x <- c(x, rnorm(n,j/10,1+j/10))
}
n = length(x)
y <- x*1 + timesale/10 + rnorm(n, 0, sd(x)/2)
fit <- lm(y~x+factor(timesale))
summary(fit)
heddata <- data.frame(y,x,timesale)
summary(heddata)

par(ask=TRUE)
matchdata <- matchprop(timesale~x,data=heddata,ytreat=0,
  distance="logit",discard="both")
table(matchdata$timesale)
fit <- matchqreg(y~timesale,qreglwr.smooth=FALSE, 
  graph.yhat=TRUE,graph.mean=TRUE,data=matchdata) 




