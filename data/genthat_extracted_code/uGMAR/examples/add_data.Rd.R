library(uGMAR)


### Name: add_data
### Title: Add data to object of class 'gsmar' defining a GMAR, StMAR or
###   G-StMAR model
### Aliases: add_data

### ** Examples

# GMAR model without data
params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
gmar13 <- GSMAR(p=1, M=3, params=params13, model="GMAR")
gmar13

# Add data to the model
gmar13 <- add_data(data=VIX, gmar13)
gmar13



