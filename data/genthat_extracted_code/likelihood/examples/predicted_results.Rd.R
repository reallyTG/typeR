library(likelihood)


### Name: predicted_results
### Title: Calculate Model Predicted Results
### Aliases: predicted_results

### ** Examples

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

predicted <- predicted_results(model, par, var, crown_rad)

## Calculate R2 - proportion of variance explained by the model relative to 
## that explained by the simple mean of the data
meanrad <- mean(crown_rad$Radius)
sse <- (crown_rad$Radius - predicted)^2
sst <- (crown_rad$Radius - meanrad)^2
R2 <- 1 - (sum(sse)/sum(sst))



