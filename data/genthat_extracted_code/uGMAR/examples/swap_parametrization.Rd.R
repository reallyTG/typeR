library(uGMAR)


### Name: swap_parametrization
### Title: Swap the parametrization of object of class 'gsmar' defining a
###   gsmar model
### Aliases: swap_parametrization

### ** Examples

# GMAR model with intercept parametrization
params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
gmar13 <- GSMAR(data=VIX, p=1, M=3, params=params13, model="GMAR")
gmar13

# Swap to mean parametrization
gmar13 <- swap_parametrization(gmar13)
gmar13



