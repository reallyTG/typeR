library(multistateutils)


### Name: length_of_stay
### Title: Estimates length of stay
### Aliases: length_of_stay

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

# Estimate length of stay in each state after a year, given starting in state 1
length_of_stay(models, 
               newdata=newdata,
               tmat, times=365.25,
               start=1)




