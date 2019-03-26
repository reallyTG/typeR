library(gnlm)


### Name: ordglm
### Title: Generalized Linear Ordinal Regression Models
### Aliases: ordglm
### Keywords: models

### ** Examples


# McCullagh (1980) JRSS B42, 109-142
# tonsil size: 2x3 contingency table
y <- c(0:2,0:2)
carrier <- gl(2,3,6)
wt <- c(19,29,24,497,560,269)
ordglm(y~carrier, weights=wt)




