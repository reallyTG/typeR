library(copula)


### Name: nacFrail.time
### Title: Timing for Sampling Frailties of Nested Archimedean Copulas
### Aliases: nacFrail.time
### Keywords: utilities

### ** Examples

## takes about 7 seconds:% so we rather test a much smaller set in R CMD check
## No test: 
nacFrail.time(10000, "Gumbel", taus=  c(0.05,(1:9)/10, 0.95))
## End(No test)
system.time(
print( nacFrail.time(1000,  "Gumbel", taus = c(0.5,1,6,9)/10) )
)



