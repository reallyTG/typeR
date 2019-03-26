library(EstSimPDMP)


### Name: CondPdf.DC.interval
### Title: Estimation of the density associated to the jump rate for
###   piecewise-deterministic Markov processes (discrete state space)
### Aliases: CondPdf.DC.interval

### ** Examples

# CondPdf.DC.interval

# Simulation of a PDMP with discrete state space
dat<-Simu.PDMP.DC(1,500,verbose=FALSE)

# Estimation of the conditional density given state=2
CondPdf.DC.interval(dat,2,0.4,5.5,70,alpha=1/4,bound=5.8)

tmin<-0.4
tmax<-5.5
N<-70
a<-(N*tmin):(N*tmax)
a<-a/N

# Conditional density given state=2
gr<-exp(-a)
# Theoretical conditional pdf
points(a,gr,"l",col="blue")



