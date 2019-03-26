library(nlr)


### Name: dfr.corrts
### Title: Derivative free Two Stage estimate
### Aliases: dfr.corrts
### Keywords: autocorrelated erro two stage estimate robust two stage
###   estimate

### ** Examples

# The direct call of nlr call dfr.corrts.
p1<- 8.06e+10
p2<- 1e11
p3<-1970
p4=6
chstart2 <- list(p1=p1,p2=p2,p3=p3,p4=p4)
irandt<-nlr::trade.ir
dfrir<- dfr.corrts (nlrobj5[[4]],data=list(xr=irandt[,1],yr=irandt[,2]),start=chstart2,
control=nlr.control(trace=TRUE),correlation = 2)
dfrir$fited$parameters



