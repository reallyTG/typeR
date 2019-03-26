library(Publish)


### Name: print.ci
### Title: Print confidence intervals
### Aliases: print.ci

### ** Examples

library(lava)
m <- lvm(Y~X)
m <- categorical(m,Y~X,K=4)
set.seed(4)
d <- sim(m,24)
ci.mean(Y~X,data=d)
x <- ci.mean(Y~X,data=d)
print(x,format="(l,u)")



