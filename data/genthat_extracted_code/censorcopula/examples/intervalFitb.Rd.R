library(censorcopula)


### Name: intervalFitb
### Title: Using censor method to break ties
### Aliases: intervalFitb
### Keywords: copula

### ** Examples

library(copula)

## Generate sample and introduce ties
data <- rCopula(50, claytonCopula(2))
data[, 1] <- round(data[, 1], digit=1)

## Estimate parameter of clayton copula from the sample
intervalFitb(copula=claytonCopula(2), method="BFGS", data)




