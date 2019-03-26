library(likelihood)


### Name: support_limits
### Title: Calculate Support Limits
### Aliases: support_limits

### ** Examples

#################
## Set up for an annealing run
#################
## Use the included crown_rad dataset
data(crown_rad)

## Create our model function - crown radius is a linear function of DBH.
## DBH is a column of data from the crown_rad dataset; a and b are single
## parameter values.
model <- function (a, b, DBH) {a + b * DBH}

## Create our parameters list and set values for a and b, and indicate
## that DBH comes from the column marked "DBH" in the crown_rad dataset
par <- list(a = 1.12, b = 0.07)
var <- list(DBH = "DBH")

## We'll use the normal probability density function dnorm - add its
## arguments to our parameter list

## "x" value in PDF is observed value
var$x <- "Radius"

## The mean is the predicted value, the outcome of the model statement. Use
## the reserved word "predicted"
var$mean <- "predicted"
var$sd <- 0.815585

## Set bounds within which to search for parameters
par_lo <- list(a = 0, b = 0)
par_hi <- list(a = 50, b = 50)

## Have dnorm calculate log likelihood
var$log <- TRUE

results <- anneal(model, par, var, crown_rad, par_lo, par_hi, dnorm, "Radius", max_iter=20000)

##################
## Do support limits - even though there are a set already in results
##################

limits <- support_limits(model, results$best_pars, var, crown_rad, dnorm, par_lo, par_hi)



