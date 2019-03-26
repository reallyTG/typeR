library(lmenssp)


### Name: lmenssp
### Title: Function to obtain the maximum likelihood estimates of the
###   parameters for linear mixed effects models with random intercept and
###   a stationary or non-stationary stochastic process component, under
###   multivariate normal response distribution
### Aliases: lmenssp
### Keywords: maximum likelihood estimation stochastic processes

### ** Examples

# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 20, ]

# fitting the model with integrated Brownian motion 
fit.ibm <- lmenssp(log.egfr ~ sex + bage + fu + pwl, data = data.sim.ibm.short,
  id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, 
  silent = FALSE)
fit.ibm
 



