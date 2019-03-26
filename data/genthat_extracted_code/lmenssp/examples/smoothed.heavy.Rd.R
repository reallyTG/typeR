library(lmenssp)


### Name: smoothed.heavy
### Title: A function for smoothing under multivariate t response
###   distribution
### Aliases: smoothed.heavy
### Keywords: smoothing multivariate t distribution

### ** Examples

# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm.heavy)
data.sim.ibm.heavy.short <- data.sim.ibm.heavy[data.sim.ibm.heavy$id <= 20, ]

# a formula to be used 
formula <- log.egfr ~ sex + bage + fu + pwl

# estimating the parameters
# tol.em is set to 10^-1 and tol.lmenssp to 10^-2 only for illustration, 
# decrease these values in your applications
fit.heavy <- lmenssp.heavy(formula = formula, data = data.sim.ibm.heavy.short, 
       id = data.sim.ibm.heavy.short$id, timeVar = data.sim.ibm.heavy.short$fu, init.em = 5, 
       maxiter.em = 1000, tol.em = 10^-1, 
       process = "ibm", silent = FALSE, dof.est = c(0.1, 10, 0.0001), tol.cd = 0.001,
       tol.lmenssp = 10^-2, silent.lmenssp = FALSE)
fit.heavy

# smoothing for the patients with ID = 1, 2, 3, 4
smo.heavy <- smoothed.heavy(formula = formula, data = data.sim.ibm.heavy.short, 
      id = data.sim.ibm.heavy.short$id, process = "ibm", timeVar = data.sim.ibm.heavy.short$fu, 
      estimate = fit.heavy$est, subj.id = c(1, 2, 3, 4))
smo.heavy 



