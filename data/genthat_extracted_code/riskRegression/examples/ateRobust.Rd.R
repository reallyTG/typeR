library(riskRegression)


### Name: ateRobust
### Title: Average Treatment Effects (ATE) for survival outcome (with
###   competing risks) using doubly robust estimating equations
### Aliases: ateRobust

### ** Examples

library(survival)
library(lava)
library(data.table)

set.seed(10)
# survival outcome, binary treatment X1 

ds <- sampleData(101,outcome="survival")
out <- ateRobust(data = ds, type = "survival",
          formula.event = Surv(time, event) ~ X1+X6,
         formula.censor = Surv(time, event==0) ~ X6,
         formula.treatment = X1 ~ X6+X2+X7, times = 1)
out
dt.out=as.data.table(out)
dt.out

# competing risk outcome, binary treatment X1 
dc=sampleData(101,outcome="competing.risks")
x=ateRobust(data = dc, type = "competing.risks",
          formula.event = list(Hist(time, event) ~ X1+X6,Hist(time, event) ~ X6),
         formula.censor = Surv(time, event==0) ~ X6,
         formula.treatment = X1 ~ X6+X2+X7, times = 1,cause=1,
                     product.limit = FALSE)
## compare with g-formula 
fit= CSC(list(Hist(time, event) ~ X1+X6,Hist(time, event) ~ X6),data=dc)
ate(fit,data = dc,treatment="X1",times=1,cause=1)
x
as.data.table(x)



