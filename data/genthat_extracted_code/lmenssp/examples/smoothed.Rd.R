library(lmenssp)


### Name: smoothed
### Title: A function for smoothing under multivariate normal response
###   distribution
### Aliases: smoothed
### Keywords: smoothing multivariate normal distribution

### ** Examples

# loading the data set and subsetting it for the first 20 patients 
# for the sake illustration of the usage of the functions
data(data.sim.ibm)
data.sim.ibm.short <- data.sim.ibm[data.sim.ibm$id <= 20, ]

# model formula to be used below
formula <- log.egfr ~ sex + bage + fu + pwl

# obtaining the maximum likelihood estimates of the model
# parameters for the model with integrated Brownian motion
fit.ibm <- lmenssp(formula = formula, data = data.sim.ibm.short,
  id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, silent = FALSE)
fit.ibm

# smoothing for subject with ID=1 and 2
subj.id <- c(1, 2)
smo.res <- smoothed(formula = formula, data = data.sim.ibm.short, 
    id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, 
    estimate = fit.ibm$estimate[, 1], subj.id = subj.id)
smo.res

# smoothing with fine interval of 0.01 within the follow-up period
smo.within <- smoothed(formula = formula, data = data.sim.ibm.short, 
    id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu,  
    estimate = fit.ibm$estimate[, 1], subj.id = subj.id, fine = 0.01)
smo.within

# one, two and three month forecasting for patients with IDs = 1 and 2
eq.forecast <- smoothed(formula = formula, data = data.sim.ibm.short, 
    id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, 
    estimate = fit.ibm$estimate[, 1], subj.id = subj.id, 
    eq.forec = c(1/12, 3))
eq.forecast

# forecasting at arbitrary time points for patients with IDs = 1 and 2
uneq.forec <- data.frame(c(1, 1, 1, 2, 2), c(1/12, 2/12, 6/12, 1/12, 3/12))
uneq.forecast <- smoothed(formula = formula, data = data.sim.ibm.short, 
    id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, 
    estimate = fit.ibm$estimate[, 1], uneq.forec = uneq.forec)
uneq.forecast

## smoothing for a new (hypothetical) patient 
data.501   <- data.frame(id = c(501, 501, 501), sex = c(0, 0, 0),
  bage = c(50, 50, 50), fu = c(0, 0.2, 0.4),
  pwl = c(0, 0, 0), log.egfr = c(4.3, 2.1, 4.1))
new.id     <-  501

# at observed time points
smo.501 <- smoothed(formula = formula, data = data.501, 
    id = data.501$id, process = "ibm", timeVar = data.501$fu, 
    estimate = fit.ibm$estimate[, 1], subj.id = new.id)
smo.501

# at fine interval of 0.01 within the follow-up period
smo.within.501 <- smoothed(formula = formula, data = data.501, 
    id = data.501$id, process = "ibm", timeVar = data.501$fu,  
    estimate = fit.ibm$estimate[, 1], subj.id = new.id, fine = 0.01)
smo.within.501

# one, two and three month forecasting 
eq.forecast.501 <- smoothed(formula = formula, data = data.501, 
    id = data.501$id, process = "ibm", timeVar = data.501$fu, 
    estimate = fit.ibm$estimate[, 1], subj.id = new.id, 
    eq.forec = c(1/12, 3))
eq.forecast.501

# forecasting at arbitrary time points 
uneq.forec.501 <- data.frame(c(501, 501, 501), c(1/12, 2/12, 4/12))
uneq.forecast.501 <- smoothed(formula = formula, data = data.501, 
    id = data.501$id, process = "ibm", timeVar = data.501$fu, 
    estimate = fit.ibm$estimate[, 1], uneq.forec = uneq.forec.501)
uneq.forecast.501



