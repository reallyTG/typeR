library(lmenssp)


### Name: boot.nm
### Title: A function to calculate bootstrap standard errors
### Aliases: boot.nm
### Keywords: bootstrap standard error calculation

### ** Examples

# loading the data set and subsetting it for the first 5 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 5, ]

# model formula to be used below
formula <- log.egfr ~ sex + bage + fu + pwl

# fitting the mixed model with Matern, kappa = 0.5
fit.matern <- lmenssp(formula = formula, data = data.sim.ibm.short,
  id = data.sim.ibm.short$id, process = "sgp-matern-0.5", timeVar = data.sim.ibm.short$fu, 
  init = c(-13, 1, -1), silent = FALSE)
fit.matern

# bootstrapping the standard errors, nboot is set to 2 for illustration
# set nboot to at least 100 in your applications
fit.matern.boot <- boot.nm(formula = formula, data = data.sim.ibm.short, 
                           id = data.sim.ibm.short$id, timeVar = data.sim.ibm.short$fu, 
                           result = fit.matern$est, matern = TRUE, kappa.or.power = 0.5, 
                           nboot = 2)
fit.matern.boot



