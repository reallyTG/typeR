library(dfcrm)


### Name: getinit
### Title: Calibrating an initial design
### Aliases: getinit
### Keywords: datasets

### ** Examples

prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
target <- 0.2

# Seach stops because it requires at least 8 subjects at the highest dose
getinit(prior, target, 25, nK=8, method="mle", detail=TRUE)

# Search stops because an incompatible design is reached
getinit(prior, 0.3, 25, nK=8, method="mle", detail=TRUE)







