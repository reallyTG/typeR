library(denpro)


### Name: slicing
### Title: Returns a one- or two-dimensional slice of a multivariate
###   function
### Aliases: slicing
### Keywords: multivariate

### ** Examples

# 2D slice of a 3D function

N<-c(26,26,26)  # choose the grid size
copula<-"gauss"
margin<-"student"
b<-4
support<-c(-b,b,-b,b,-b,b)
r<-0.5       # parameter of the copula
t<-c(2,2,3)  # degreeds of freedom for the student margin
pcf<-pcf.func(copula,N,marginal=margin,support=support,r=r,t=t)

sl<-slicing(pcf,d1=1,d2=2,vecci=0)
dp<-draw.pcf(sl)
persp(dp$x,dp$y,dp$z,theta=30,phi=30)   

# 1D slice of a 2D function
N<-c(60,60)                  
pcf<-sim.data(N=N,type="mulmod")

sl<-slicing(pcf,vecci=0)
dp<-draw.pcf(sl)
plot(dp$x,dp$y,type="l")




