library(Publish)


### Name: publish.riskRegression
### Title: Publishing results of riskRegression
### Aliases: publish.riskRegression

### ** Examples

library(prodlim)
library(riskRegression)
library(lava)
library(survival)
set.seed(20)
d <- SimCompRisk(20)
f <- ARR(Hist(time,event)~X1+X2,data=d,cause=1)
publish(f)
publish(f,digits=c(1,3))



