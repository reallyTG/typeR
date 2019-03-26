library(exactRankTests)


### Name: cscores
### Title: Computation of Scores
### Aliases: cscores cscores.default cscores.Surv cscores.factor
### Keywords: misc

### ** Examples


y <- rnorm(50)
# v.d. Waerden scores
nq <- cscores(y, type="Normal", int=TRUE)
# quantile for m=20 observations in the first group
qperm(0.1, nq, 20)




