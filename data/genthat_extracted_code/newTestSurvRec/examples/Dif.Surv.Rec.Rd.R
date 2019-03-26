library(newTestSurvRec)


### Name: Dif.Surv.Rec
### Title: This function computes statistical difference between two
###   survival curves
### Aliases: Dif.Surv.Rec
### Keywords: Statistical Tests

### ** Examples
data(TBCplapyr)
#Return the p-values of the all tests
Dif.Surv.Rec(TBCplapyr,"all",0,0,0,0)
#Return the p-value of the LRrec test
Dif.Surv.Rec(TBCplapyr)
#Return the p-value of the Grec test
Dif.Surv.Rec(TBCplapyr,"Grec")
#Return the p-values of the CMrec tests
#The CMrec test with this parameters generates LRrec test
Dif.Surv.Rec(TBCplapyr,"all",0,0,0,0)
#The CMrec test with this parameters generates Grec test
Dif.Surv.Rec(TBCplapyr,"all",0,0,1,0)
#The CMrec test with this parameters generates TWrec test
Dif.Surv.Rec(TBCplapyr,"all",0,0,0.5,0)



