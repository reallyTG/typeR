library(forestChange)


### Name: plot.EBVmetric
### Title: EBV-metric plot
### Aliases: plot.EBVmetric

### ** Examples

## Simulating an objec of class EBVmetric
set.seed(1)
areaKm2 <- 1800 - (rnorm(11))
ats <- ts(areaKm2, start = 2000)
class(ats) <- c('EBVmetric', class(ats)) 

## A plot of the 'EBVmetric' object
plot(ats)



