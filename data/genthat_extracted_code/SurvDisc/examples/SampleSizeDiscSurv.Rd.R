library(SurvDisc)


### Name: SampleSizeDiscSurv
### Title: Sample Size for Discrete Time Survival
### Aliases: SampleSizeDiscSurv

### ** Examples

set.seed(1234)
k=50
m1=3.05

h0=0.9*(exp(-c(0:(k-2))*m1/(k-1))-exp(-c(1:(k-1))*m1/(k-1)))
h0=h0/(h0+exp(-c(1:(k-1))*m1/(k-1)))
p0=exp(-c(0:(k-1))*m1/(k-1))
p0=(p0[1:(k-1)]*0.9+p0[2:k]*0.1)/2
h1=0.9*(exp(-c(0:(k-2))*2*m1/(k-1))-exp(-c(1:(k-1))*2*m1/(k-1)))
h1=h1/(h1+exp(-c(1:(k-1))*2*m1/(k-1)))
p1=exp(-2*c(0:(k-1))*m1/(k-1))
p1=(p1[1:(k-1)]*0.9+p1[2:k]*0.1)/2

fa=AsympDiscSurv(h0=h0,h1=h1,p0=p0,p1=p1)

(SSDS1=SampleSizeDiscSurv(power=0.9,alpha=0.025,alternative="greater",beta0=0,h0,h1,
  p0,p1,ties.method="efron",method="asymptotic",AMV=fa,Nvec=NULL,test="Wald"))




