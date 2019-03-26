library(RHMS)


### Name: reservoirRouting
### Title: reservoir routing
### Aliases: reservoirRouting
### Keywords: list

### ** Examples

inflow1<-sin(seq(0,pi,length.out=50))*1000
ratingCurve1<-data.frame(s=0:49*2,h=100:149)
dischargeCurve1<-data.frame(q=0:9*250,h=140:149)
reservoir_sim<-reservoirRouting(inflow=inflow1, ratingCurve=ratingCurve1,
                                dischargeCurve=dischargeCurve1, 
                                initialStorage=80, capacity=80, 
                                simulation = c(interval = 3600 * 1, period = 60))
plot(reservoir_sim$operation[,2],typ="o",
     ylab="Discharge rate (cms)",
     xlab="Time step")
lines(reservoir_sim$operation[,4])



