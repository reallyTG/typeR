library(rolr)


### Name: rhier
### Title: Finding Optimal Cutpoints Using a Hierarchical Method
### Aliases: rhier

### ** Examples

library(rolr)

#simulate data with true underlying cutpoints and hazard goes up as covariate goes up
d=simdata(nn = 150, hr = c(1, 2, 3), hazard.func = "step",
          props=c(1/3, 1/3, 1/3), censoring.rate = 0)

#finding optimal cutpoints using alt = 'decrease' option
res=rhier(times=d$times, status=d$status, x=d$x, ns=15, alt='decrease')

#do it again using alt = 'increase', the results are the same as earlier
#because it doesn't matter what you choose for the alt option
res2=rhier(times=d$times, status=d$status, x=d$x, ns=15, alt='increase')





