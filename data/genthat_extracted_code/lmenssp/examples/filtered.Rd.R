library(lmenssp)


### Name: filtered
### Title: A function for filtering under multivariate normal response
###   distribution
### Aliases: filtered
### Keywords: filtering

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
  id = data.sim.ibm.short$id, process = "ibm", timeVar = data.sim.ibm.short$fu, 
  silent = FALSE)
fit.ibm

# filtering for subjects with ID=1 and 2
subj.id <- c(1, 2)
fil.res <- filtered(formula = formula, data = data.sim.ibm.short, 
    id = data.sim.ibm.short$id, process = "ibm",  timeVar = data.sim.ibm.short$fu, 
    estimate = fit.ibm$estimate[, 1], subj.id = subj.id)
fil.res

# filtering for a new (hypothetical) subject
data.501   <- data.frame(id = c(501, 501, 501), sex = c(0, 0, 0),
   bage = c(50, 50, 50), fu = c(0, 0.2, 0.4), 
   pwl = c(0, 0, 0), log.egfr = c(4.3, 2.1, 4.1))
data.501
fil.501 <- filtered(formula = formula, data = data.501, 
   id = data.501$id, process = "ibm", timeVar = data.501$fu,  
   estimate = fit.ibm$estimate[, 1], subj.id = 501)
fil.501
 



