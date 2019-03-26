library(NTS)


### Name: tvAR
### Title: Estimate Time-Varying Coefficient AR Models
### Aliases: tvAR

### ** Examples

t=50
x=rnorm(t)
phi1=matrix(0.4,t,1)
for (i in 2:t){
   phi1[i]=0.7*phi1[i-1]+rnorm(1,0,0.1)
	x[i]=phi1[i]*x[i-1]+rnorm(1)
}
est=tvAR(x,1)



