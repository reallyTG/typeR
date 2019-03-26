library(uGMAR)


### Name: iterate_more
### Title: Maximum likelihood estimation of GMAR, StMAR or G-StMAR model
###   with preliminary estimates
### Aliases: iterate_more

### ** Examples

## No test: 
# Estimate GMAR model with only 50 generations of genetic algorithm and
# only 1 iteration in variable metric algorithm
fit12 <- fitGSMAR(VIX, 1, 2, maxit=1, ngen=50)
fit12

# Iterate more since iteration limit was reached
fit12 <- iterate_more(fit12)
fit12
## End(No test)



