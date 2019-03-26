library(circular)


### Name: summary.circular
### Title: Circular Summary Statistics
### Aliases: summary.circular
### Keywords: univar

### ** Examples

# Compute summary statistics of a random sample of observations. 
data <- circular(runif(50, 0, pi))
summary(data)
summary(data.frame(data, runif(50, 0, pi)))



