library(EstSimPDMP)


### Name: EstSimPDMP-package
### Title: Nonparametric estimation of the jump rate and simulation for
###   piecewise-deterministic Markov processes
### Aliases: EstSimPDMP-package EstSimPDMP

### ** Examples

# Simu.Cond.HR
example<-function(x,t){
	sqrt(sum(x^2))+t
}
# Simulations of 50 iid random variables with hazard rate=example given x=3
Simu.Cond.HR(50,example,3)

# Simulations of 50 iid random variables with hazard rate=example given x=0.5
# Simu.Cond.HR(50,example,0.5)


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



