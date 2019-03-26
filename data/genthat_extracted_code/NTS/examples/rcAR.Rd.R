library(NTS)


### Name: rcAR
### Title: Estimating of Random-Coefficient AR Models
### Aliases: rcAR

### ** Examples

t=50
x=rnorm(t)
phi1=matrix(0.4,t,1)
for (i in 2:t){
   phi1[i]=0.7*phi1[i-1]+rnorm(1,0,0.1)
	x[i]=phi1[i]*x[i-1]+rnorm(1)
}
est=rcAR(x,1,FALSE)



