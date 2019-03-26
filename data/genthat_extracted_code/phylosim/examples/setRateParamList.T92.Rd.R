library(phylosim)


### Name: setRateParamList.T92
### Title: Set the rate parameters
### Aliases: setRateParamList.T92 T92.setRateParamList
###   setRateParamList,T92-method

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
 


