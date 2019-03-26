library(multistateutils)


### Name: plot_predicted_pathway
### Title: Displays the predicted flow for a given individual through the
###   system
### Aliases: plot_predicted_pathway

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

# Plot pathway diagram at 2-yearly intervals up to 10-years 
time_points <- seq(0, 10, by=2) * 365.25

## No test: 
plot_predicted_pathway(models, tmat, newdata, time_points, 1)
## End(No test)




