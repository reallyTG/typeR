library(metafor)


### Name: dat.pritz1997
### Title: Studies on the Effectiveness of Hyperdynamic Therapy for
###   Treating Cerebral Vasospasm
### Aliases: dat.pritz1997
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.pritz1997))

### computation of "weighted average" in Zhou et al. (1999), Table IV
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat, add=0)
theta.hat    <- sum(dat$ni * dat$yi) / sum(dat$ni)
se.theta.hat <- sqrt(sum(dat$ni^2 * dat$vi) / sum(dat$ni)^2)
ci.lb        <- theta.hat - 1.96*se.theta.hat
ci.ub        <- theta.hat + 1.96*se.theta.hat
round(c(estimate = theta.hat, se = se.theta.hat, ci.lb = ci.lb, ci.ub = ci.ub), 4)

### this is identical to a FE model with sample size weights
rma(yi, vi, weights=ni, method="FE", data=dat)

### random-effects model with raw proportions
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat)
res <- rma(yi, vi, data=dat)
predict(res)

### random-effects model with logit transformed proportions
dat <- escalc(measure="PLO", xi=xi, ni=ni, data=dat)
res <- rma(yi, vi, data=dat)
predict(res, transf=transf.ilogit)

### mixed-effects logistic regression model
res <- rma.glmm(measure="PLO", xi=xi, ni=ni, data=dat)
predict(res, transf=transf.ilogit)



