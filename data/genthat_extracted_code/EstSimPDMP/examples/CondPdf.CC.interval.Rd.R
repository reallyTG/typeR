library(EstSimPDMP)


### Name: CondPdf.CC.interval
### Title: Estimation of the density associated to the jump rate for
###   piecewise-deterministic Markov processes (continuous state space)
### Aliases: CondPdf.CC.interval

### ** Examples

# CondPdf.CC.interval

# Simulation of a PDMP with continuous state space
dat<-Simu.PDMP(2.3,500,verbose=FALSE)

# Estimation of the conditional density given state=1.8
CondPdf.CC.interval(dat,1.8,0.3,0.5,7.5,70,h=1/3,bound=7.8)

tmin<-0.5
tmax<-7.5
N<-70
a<-tmin:N*tmax
a<-a/N

x<-1.8
# Theoretical conditional pdf given state=1.8
grid<-(1/(1+x))*exp(-(1/(1+x))*a)
points(a,grid,"l",col="blue")



