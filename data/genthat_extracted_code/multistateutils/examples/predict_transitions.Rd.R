library(multistateutils)


### Name: predict_transitions
### Title: Estimates transition probabilities
### Aliases: predict_transitions

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

# New individual to estimate transition probabilities for
newdata <- data.frame(age="20-40", dissub="AML")

# Estimate transition probabilties at 1 year
predict_transitions(models, newdata, tmat, times=365)

# Estimate transition probabilties at 1 year given we know they're alive after 6 months
predict_transitions(models, newdata, tmat, times=365, start_times = 365/2)




