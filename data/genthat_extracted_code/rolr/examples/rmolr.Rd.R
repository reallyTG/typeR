library(rolr)


### Name: rmolr
### Title: Finding Optimal Cutpoints Using Modified Ordered Logrank (MOL)
###   Tests
### Aliases: rmolr

### ** Examples

library(rolr)

##### -------- Example 1

#simulate data with true cutpoints and hazard goes up as covariate goes up
d=simdata(nn = 150, hr = c(1, 2, 3), hazard.func = "step",
          props=c(1/3, 1/3, 1/3), censoring.rate = 0)

#using alt = 'decrease', the test statistics are positive, so the results
#are correct.
res=rmolr(times=d$times, status=d$status, x=d$x, ns=15, alt='decrease')
names(res)

#do it again using alt = 'increase', now the test statistics are negative
#so the results are not right. So you have to switch back to alt='decrease'
#to get positive statistics and the correct optimal cutpoints here.
res2=rmolr(times=d$times, status=d$status, x=d$x, ns=15, alt='increase')
names(res2)

##### -------- Example 2

#Simulate data with true cutpoints and hazard goes down as covariate goes up
d=simdata(nn = 150, hr = c(3, 2, 1), hazard.func = "step",
          props=c(1/3, 1/3, 1/3), censoring.rate = 0)

#using alt = 'decrease', the test statistics are negative and so the results
#are not right.
res=rmolr(times=d$times, status=d$status, x=d$x, ns=15, alt='decrease')
res[['best.splits.molr']]

#do it again using alt = 'increase', now the test statistics are positive
#and thus the results are correct.
res2=rmolr(times=d$times, status=d$status, x=d$x, ns=15, alt='increase')
res2[['best.splits.molr']]




