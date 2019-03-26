library(lmenssp)


### Name: variogram
### Title: A function for calculating the empirical variogram for data sets
###   with regularly or irregularly spaced follow-up time points
### Aliases: variogram
### Keywords: variogram

### ** Examples

# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 20, ]

# obtaining empirical residuals by a linear model
# and calculating the empirical variogram
lm.fit <- lm(log.egfr ~ sex + bage + fu + pwl, data = data.sim.ibm.short)
variogram(resid = resid(lm.fit), timeVar = data.sim.ibm.short$fu, id = data.sim.ibm.short$id,
  binwidth = 0.1, numElems = 20, inc.var = FALSE)




