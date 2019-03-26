library(likelihood)


### Name: likeli_4_optim
### Title: Use Likelihood with Optim
### Aliases: likeli_4_optim

### ** Examples

#################
## Set up for likeli
#################
## Use the included crown_rad dataset
data(crown_rad)

## Create our model function - crown radius is a linear function of DBH.
## DBH is a column of data from the crown_rad dataset; a and b are single
## parameter values.
model <- function (a, b, DBH) {a + b * DBH}

## We are planning to get maximum likelihood estimates for a and b.  Create
## the list that says where all other functions and data are to be found.
## Indicate that DBH comes from the column marked "DBH" in the crown_rad dataset.
var<-list(DBH = "DBH")

## We'll use the normal probability density function dnorm - add its
## arguments to our parameter list
## "x" value in PDF is observed value
var$x <- "Radius"

## The mean is the predicted value, the outcome of the model statement. Use
## the reserved word "predicted"
var$mean <- "predicted"
var$sd <- 1.0

## Have dnorm calculate log likelihood
var$log <- TRUE

## Set up a vector with initial values for a and b
par_2_analyze <- c(0.1, 0.1)

## Set up the vector with the names of a and b, so likeli_4_optim knows
## what the values in for_optim are
par_names <- c("a", "b")

## Set your choice of optim controls - pass the other likeli_4_optim arguments
## by name so optim knows they are for likeli_4_optim
## Remember to set the fnscale option of optim to a negative value to perform
## a maximization rather than a minimization

optim(par_2_analyze, likeli_4_optim, method = "Nelder-Mead",
  control = list(fnscale = -1), model = model, par_names = par_names,
  var = var, source_data = crown_rad, pdf = dnorm)



