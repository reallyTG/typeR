library(secr)


### Name: score.test
### Title: Score Test for SECR Models
### Aliases: score.test score.table
### Keywords: htest

### ** Examples


## Not run: 
##D     AIC (secrdemo.0, secrdemo.b)
##D     st <- score.test (secrdemo.0, g0 ~ b)
##D     st
##D     score.table(st)
##D 
##D     ## adding a time covariate to separate occasions (1,2) from (3,4,5)
##D     secrdemo.0$timecov <- data.frame(t2 = factor(c(1,1,2,2,2)))
##D     st2 <- score.test (secrdemo.0, g0 ~ t2)
##D     score.table(st,st2)
## End(Not run)




