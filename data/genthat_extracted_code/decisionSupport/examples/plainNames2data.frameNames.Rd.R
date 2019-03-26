library(decisionSupport)


### Name: plainNames2data.frameNames
### Title: Transform model function variable names: plain to data.frame
###   names.
### Aliases: plainNames2data.frameNames

### ** Examples

 profit1<-function(){
   list(Profit=revenue-costs)
 }
 profit2<-plainNames2data.frameNames(modelFunction=profit1, 
                                               plainNames=c("revenue", "costs"))
 print(profit2)
 is.function(profit2)
 profit2(data.frame("revenue"=10,"costs"=2))



