library(multistateutils)


### Name: cohort_simulation
### Title: Runs a cohort discrete event simulation
### Aliases: cohort_simulation

### ** Examples

library(multistateutils)
library(mstate)
library(flexsurv)

# Convert data to long
data(ebmt3)
tmat <- trans.illdeath()
long <- msprep(time=c(NA, 'prtime', 'rfstime'),
               status=c(NA, 'prstat', 'rfsstat'),
               data=ebmt3,
               trans=tmat,
               keep=c('age', 'dissub'))

# Fit parametric models
models <- lapply(1:3, function(i) {
    flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
})

sim <- cohort_simulation(models, ebmt3, tmat)



