library(rolr)


### Name: rlr
### Title: Calculating Running Logrank Test
### Aliases: rlr

### ** Examples

library(rolr)

##### -------- Example 1

#simulate survival where hazard increases as covariate increases
d=simdata(nn = 150, hr.linear = 2, hazard.func = "linear", censoring.rate = 0)

#using trend = 'decrease', the test statistics are positive, which is good
res=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='decrease')
head(res)

#do it again with trend = 'increase', now the test statistics are negative.
#So you want to switch to trend='decrease'.
res2=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='increase')
head(res2)

#Note that the test statistics are the same except the signs
res[,'logrank.stat']+res2[,'logrank.stat']

#do it with exact method, how close is it to the approximate method?
res3=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='decrease',
         method="exact")
cor(res[,'logrank.stat'], res3[,'logrank.stat'])

##### -------- Example 2

#Simulate survival where hazard decreases as covariate increases
d=simdata(nn = 150, hr.linear = 1/3, hazard.func = "linear", censoring.rate = 0)

#using trend = 'decrease', and the test statistics are negative, which
#is not good
res=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='decrease')
head(res)

#do it again with trend = 'increase', now the test statistics are positive,
#which is good
res2=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='increase')
head(res2)

#Note that the test statistics are the same except the signs
res[,'logrank.stat']+res2[,'logrank.stat']

#do it with exact method, how close is it to the approximate method?
res3=rlr(times=d$times, status=d$status, x=d$x, ns=15, trend='increase',
         method="exact")
cor(res[,'logrank.stat'], res3[,'logrank.stat'])




