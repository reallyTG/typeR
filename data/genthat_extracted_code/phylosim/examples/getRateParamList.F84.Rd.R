library(phylosim)


### Name: getRateParamList.F84
### Title: Get the rate parameters
### Aliases: getRateParamList.F84 F84.getRateParamList
###   getRateParamList,F84-method

### ** Examples

       # create F84 object
       p<-F84()
       # set/get rate parameters
       setRateParamList(p,list("Kappa"=3))
       getRateParamList(p)
       # set/get rate parameters via virtual field
       p$rateParamList<-list("Kappa"=2.5)
       p$rateParamList
       # get object summary
       summary(p)
 


