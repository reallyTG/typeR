library(nsga2R)


### Name: nsga2R
### Title: R Based Non-dominated Sorting Genetic Algorithm II
### Aliases: nsga2R
### Keywords: optimize

### ** Examples

# find the non-dominated solutions of zdt3 test problem
results <- nsga2R(fn=zdt3, varNo=30, objDim=2, lowerBounds=rep(0,30), upperBounds=rep(1,30),
  popSize=50, tourSize=2, generations=50, cprob=0.9, XoverDistIdx=20, mprob=0.1,MuDistIdx=3)

plot(results$objectives)



