library(RM2)


### Name: EMSRb
### Title: Perform EMSR-b with Buy-up Heuristic for the Single-Resource
###   Problem
### Aliases: EMSRb
### Keywords: optimize

### ** Examples

## Run a simple EMRSb instance
Fare <- c(150, 100, 50, 250)
Mean <- c(75, 125, 500, 50)
Var <- c(75, 125, 500, 50)
cap <- 400
p <- EMSRb(Fare = Fare, Mean = Mean, Var = Var, cap = cap)
p



