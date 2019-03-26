library(bnclassify)


### Name: greedy_wrapper
### Title: Learn Bayesian network classifiers in a a greedy wrapper
###   fashion.
### Aliases: greedy_wrapper fssj bsej tan_hc kdb tan_hcsp

### ** Examples

data(car)
tanhc <- tan_hc('class', car, k = 5, epsilon = 0)  
## Not run: plot(tanhc)
  



