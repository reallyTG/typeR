library(MESS)


### Name: drop1.geem
### Title: Drop All Possible Single Terms to a geem Model Using Wald or
###   Score Test
### Aliases: drop1.geem
### Keywords: htest

### ** Examples


library(geeM)
library(geepack)
data(ohio)
## Not run: 
##D fit <- geem(resp ~ age + smoke + age:smoke, id=id, data=ohio,
##D             family="binomial", corstr="exch", scale.fix=TRUE)
##D drop1(fit)
## End(Not run)




