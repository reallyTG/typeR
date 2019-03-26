library(phylosim)


### Name: getRateParamList.T92
### Title: Get the rate parameters
### Aliases: getRateParamList.T92 T92.getRateParamList
###   getRateParamList,T92-method

### ** Examples

       # create a T92 object
       p<-T92()
       # set/get rate parameters
       setRateParamList(p,list(
               "Alpha"=1,
               "Beta"=0.5
        ))
       getRateParamList(p)
       # set/get rate parameters via virtual field
       p$rateParamList<-list(
               "Alpha"=1,
               "Beta"=3
        )
       p$rateParamList
       # get object summary
       summary(p)
 


