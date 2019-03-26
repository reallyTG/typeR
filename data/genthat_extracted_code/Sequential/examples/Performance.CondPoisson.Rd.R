library(Sequential)


### Name: Performance.CondPoisson
### Title: Statistical power, expected time to signal and expected sample
###   size for the continuous sequential CMaxSPRT for Poisson data with
###   limited information from historical cohort.
### Aliases: Performance.CondPoisson
### Keywords: Continuous CmaxSPRT performance

### ** Examples


## First calculate the critical value with upper limit defined in terms of
## the number of observed events in surveillance population (K=50), with 50
## events in historical data, no delayed start, and alpha=0.05: 
# res<-CV.CondPoisson(Inference="exact",StopType="Cases",K=20,cc=50,M=1,
# alpha=0.05)

# cvt<- res[[2]] 

## calculate the performance using the critical value 'cvt' from the previous
## step, under RR=1.5:
#Performance.CondPoisson(Inference="exact",cv=cvt,StopType="Cases",K=20,cc=50,
# M=1,RR=1.5) 




