library(MESS)


### Name: drop1.geeglm
### Title: Drop All Possible Single Terms to a geeglm Model Using Wald or
###   Score Test
### Aliases: drop1.geeglm
### Keywords: htest

### ** Examples


library(geepack)
data(ohio)
fit <- geeglm(resp ~ age + smoke + age:smoke, id=id, data=ohio,
             family=binomial, corstr="exch", scale.fix=TRUE)
drop1(fit)




