library(likelihood)


### Name: likeli
### Title: Calculate Likelihood
### Aliases: likeli

### ** Examples

library(likelihood)

## Use the included crown_rad dataset
data( crown_rad )

## Create our model function - crown radius is a linear function of DBH.
## DBH is a column of data from the crown_rad dataset; a and b are single
## parameter values.
model <- function (a, b, DBH) {a + b * DBH}

## Create our parameters list and set values for a and b
par <- list(a = 1.12, b = 0.07)

## Create a place to put all the other data needed by
## the model and PDF, and indicate that DBH comes from 
## the column marked "DBH" in the dataset
var <- list(DBH = "DBH")

## We'll use the normal probability density function dnorm - add its
## arguments to our parameter list

## "x" value in PDF is observed value
var$x <- "Radius"

## The mean is the predicted value, the outcome of the model statement. Use
## the reserved word "predicted"
var$mean <- "predicted"
## Use a fixed value of the standard deviation for this example
var$sd <- 0.815585

## Have dnorm calculate log likelihood
var$log <- TRUE

result <- likeli(model, par, var, crown_rad, dnorm)

## Alternately: reference crown_rad$DBH directly in the function without
## using var
model <- function (a, b) {a + b * crown_rad$DBH}
var <- list(x = "Radius",
            mean = "predicted",
            sd = 0.815585,
            log = TRUE)
result <- likeli(model, par, var, crown_rad, dnorm)



