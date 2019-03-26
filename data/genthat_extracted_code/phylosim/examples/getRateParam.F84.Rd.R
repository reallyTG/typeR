library(phylosim)


### Name: getRateParam.F84
### Title: Get the value of a rate parameter
### Aliases: getRateParam.F84 F84.getRateParam getRateParam,F84-method

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
 


