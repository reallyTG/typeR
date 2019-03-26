library(lmenssp)


### Name: var.inspect
### Title: A function for calculating empirical variances with respect to
###   time for data sets with regularly or irregularly spaced follow-up
###   time points
### Aliases: var.inspect
### Keywords: variances

### ** Examples

# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 20, ]

# obtaining empirical residuals by a linear model
# and calculating the empirical variances
lm.fit <- lm(log.egfr ~ sex + bage + fu + pwl, data = data.sim.ibm.short)
var.inspect(resid = resid(lm.fit), timeVar = data.sim.ibm.short$fu, binwidth = 0.1,
   numElems = 20, irregular = TRUE)



