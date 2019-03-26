library(STAR)


### Name: summary.transformedTrain
### Title: Summary of transformedTrain Objects
### Aliases: summary.transformedTrain
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## Let us consider neuron 1 of the CAL2S data set
##D data(CAL2S)
##D CAL2S <- lapply(CAL2S,as.spikeTrain)
##D CAL2S[["neuron 1"]]
##D renewalTestPlot(CAL2S[["neuron 1"]])
##D summary(CAL2S[["neuron 1"]])
##D ## Make a data frame with a 4 ms time resolution
##D cal2Sdf <- mkGLMdf(CAL2S,0.004,0,60)
##D ## keep the part relative to neuron 1, 2 and 3 separately
##D n1.cal2sDF <- cal2Sdf[cal2Sdf$neuron=="1",]
##D n2.cal2sDF <- cal2Sdf[cal2Sdf$neuron=="2",]
##D n3.cal2sDF <- cal2Sdf[cal2Sdf$neuron=="3",]
##D ## remove unnecessary data
##D rm(cal2Sdf)
##D ## Extract the elapsed time since the second to last and
##D ## third to last for neuron 1. Normalise the result. 
##D n1.cal2sDF[c("rlN.1","rsN.1","rtN.1")] <- brt4df(n1.cal2sDF,"lN.1",2,c("rlN.1","rsN.1","rtN.1"))
##D ## load mgcv library
##D library(mgcv)
##D ## fit a model with a tensorial product involving the last
##D ## three spikes and using a cubic spline basis for the last two
##D ## To gain time use a fixed df regression spline
##D n1S.fitA <- gam(event ~ te(rlN.1,rsN.1,bs="cr",fx=TRUE) + rtN.1,data=n1.cal2sDF,family=binomial(link="logit"))
##D ## transform time
##D N1.Lambda <- transformedTrain(n1S.fitA)
##D ## check out the resulting spike train using the fact
##D ## that transformedTrain objects inherit from spikeTrain
##D ## objects
##D N1.Lambda
##D ## Use more formal checks
##D summary(N1.Lambda)
##D plot(N1.Lambda,which=c(1,2,4,5),ask=FALSE)
##D ## Transform spike trains of neuron 2 and 3
##D N2.Lambda <- transformedTrain(n1S.fitA,n2.cal2sDF$event)
##D N3.Lambda <- transformedTrain(n1S.fitA,n3.cal2sDF$event)
##D ## Check interactions
##D summary(N2.Lambda %frt% N1.Lambda)
##D summary(N3.Lambda %frt% N1.Lambda)
##D plot(N2.Lambda %frt% N1.Lambda,ask=FALSE)
##D plot(N3.Lambda %frt% N1.Lambda,ask=FALSE)
## End(Not run)



