library(NTS)


### Name: tvARFiSm
### Title: Filtering and Smoothing for Time-Varying AR Models
### Aliases: tvARFiSm

### ** Examples

t=50
x=rnorm(t)
phi1=matrix(0.4,t,1)
for (i in 2:t){
   phi1[i]=0.7*phi1[i-1]+rnorm(1,0,0.1)
	x[i]=phi1[i]*x[i-1]+rnorm(1)
}
est=tvAR(x,1)
tvARFiSm(x,1,FALSE,est$par)



