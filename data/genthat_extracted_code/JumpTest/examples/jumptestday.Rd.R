library(JumpTest)


### Name: jumptestday
### Title: Nonparametric jump test for each interval
### Aliases: jumptestday

### ** Examples

orip <- runif(100)
testres <- jumptestday(orip)
ts <- testres@stat
pv <- testres@pvalue



