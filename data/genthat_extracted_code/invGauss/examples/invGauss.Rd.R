library(invGauss)


### Name: invGauss
### Title: Threshold regression that fits the (randomized drift) inverse
###   Gaussian distribution to survival data.
### Aliases: invGauss

### ** Examples


# Simple run:
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, data = d.oropha.rec)
summary(res)

# Use covariates for c, with exponential link function
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, formula.c = ~ cond + nstage + tstage, 
data = d.oropha.rec) # MODEL 5 (TABLE 10.2, page 412) IN SPRINGER BOOK
summary(res)




