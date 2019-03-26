library(rolr)


### Name: rsolr12
### Title: Finding Optimal Cutpoints Using Simple Ordered Logrank (SOL)
###   Tests
### Aliases: rsolr12

### ** Examples

library(rolr)

##### -------- Example 1

#simulate data with 2 underlying true cutpoints and hazard goes up as x goes up
d=simdata(nn = 150, hr = c(1, 2, 3), hazard.func = "step",
          props=c(1/3, 1/3, 1/3), censoring.rate = 0)

#using alt = 'decrease', the test statistics are positive, so it is good
res=rsolr12(times=d$times, status=d$status, x=d$x, ns=15, alt='decrease')
names(res)
res[['best.splits.solr1']]
res[['best.splits.solr2']]

#do it again using alt = 'increase', now the test statistics are negative and
#so the results are not right. So you have to switch back to alt='decrease' to
#get positive statistics and the correct optimal cutpoints here.
res2=rsolr12(times=d$times, status=d$status, x=d$x, ns=15, alt='increase')
res2[['best.splits.solr1']]
res2[['best.splits.solr2']]

##### -------- Example 2

#simulate data with true cutpoints and hazard goes down as covariate goes up
d=simdata(nn = 150, hr = c(3, 2, 1), hazard.func = "step",
          props=c(1/3, 1/3, 1/3), censoring.rate = 0)

#using alt = 'decrease', the test statistics are negative (so the results
#are not right).
res=rsolr12(times=d$times, status=d$status, x=d$x, ns=15, alt='decrease')
res[['best.splits.solr1']]
res[['best.splits.solr2']]

#do it again using alt = 'increase', now it is right
res2=rsolr12(times=d$times, status=d$status, x=d$x, ns=15, alt='increase')
res2[['best.splits.solr1']]
res2[['best.splits.solr2']]



