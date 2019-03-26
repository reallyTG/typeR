library(JumpTest)


### Name: jumptestperiod
### Title: Nonparametric jump test for a long period
### Aliases: jumptestperiod

### ** Examples

orip <- matrix(runif(3000),1000,3)
testres <- jumptestperiod(orip)
ts <- testres@stat
pv <- testres@pvalue
adjpv <- testres@adjp



