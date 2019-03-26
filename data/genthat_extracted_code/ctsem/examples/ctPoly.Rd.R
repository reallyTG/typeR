library(ctsem)


### Name: ctPoly
### Title: Plots uncertainty bands with shading
### Aliases: ctPoly

### ** Examples

plot(0:100,sqrt(0:100),type='l')
ctPoly(x=0:100, y=sqrt(0:100), 
yhigh=sqrt(0:100) - runif(101), 
ylow=sqrt(0:100) + runif(101),
col=adjustcolor('red',alpha.f=.1))



