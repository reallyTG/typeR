library(invGauss)


### Name: summary.invGauss
### Title: Summarize the estimation result from invGauss
### Aliases: summary.invGauss

### ** Examples


# Simple run:
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, data = d.oropha.rec)
summary(res)

# Use covariates for c, with exponential link function
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, formula.c = ~ cond + nstage + tstage, 
data = d.oropha.rec) # MODEL 5 (TABLE 10.2) IN SPRINGER BOOK
summary(res)



