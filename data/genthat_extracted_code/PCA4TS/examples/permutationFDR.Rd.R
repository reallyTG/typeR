library(PCA4TS)


### Name: permutationFDR
### Title: Permutation Using the FDR Method
### Aliases: permutationFDR

### ** Examples

## Example 1 (Example 5 of Chang et al.(2014)).
## p=6, x_t consists of 3 independent subseries with 3, 2 and 1 components.

p=6;n=1500
# Generate x_t
X=mat.or.vec(p,n)
x=arima.sim(model=list(ar=c(0.5, 0.3), ma=c(-0.9, 0.3, 1.2,1.3)),n=n+2,sd=1)
for(i in 1:3) X[i,]=x[i:(n+i-1)]
x=arima.sim(model=list(ar=c(0.8,-0.5),ma=c(1,0.8,1.8) ),n=n+1,sd=1)
for(i in 4:5) X[i,]=x[(i-3):(n+i-4)]
x=arima.sim(model=list(ar=c(-0.7, -0.5), ma=c(-1, -0.8)),n=n,sd=1)
X[6,]=x
# Generate y_t
A=matrix(runif(p*p, -3, 3), ncol=p)
Y=A%*%X
Y=t(Y)
Trans=segmentTS(Y, k0=5)
# The transformed series z_t
Z=Trans$X
# Plot the cross correlogram of x_t and y_t
Z=data.frame(Z)
names(Z)=c("Z1","Z2","Z3","Z4","Z5","Z6")
# The cross correlogram of z_t shows 3-2-1 block pattern
acfZ=acf(Z, plot=FALSE)
plot(acfZ, max.mfrow=6, xlab='', ylab='',  mar=c(1.8,1.3,1.6,0.5),
    oma=c(1,1.2,1.2,1), mgp=c(0.8,0.4,0),cex.main=1)
# Identify the permutation mechanism
permutation=permutationFDR(Z,Beta=10^(-8))
permutation$Groups


## Example 2 (Example 6 of Chang et al.(2014)).
## p=20, x_t consists of 5 independent subseries with 6, 5, 4, 3 and 2 components.

p=20;n=3000
# Generate x_t
X=mat.or.vec(p,n)
x=arima.sim(model=list(ar=c(0.5, 0.3), ma=c(-0.9, 0.3, 1.2,1.3)),n.start=500,n=n+5,sd=1)
for(i in 1:6) X[i,]=x[i:(n+i-1)]
x=arima.sim(model=list(ar=c(-0.4,0.5),ma=c(1,0.8,1.5,1.8)),n.start=500,n=n+4,sd=1)
for(i in 7:11) X[i,]=x[(i-6):(n+i-7)]
x=arima.sim(model=list(ar=c(0.85,-0.3),ma=c(1,0.5,1.2)), n.start=500,n=n+3,sd=1)
for(i in 12:15) X[i,]=x[(i-11):(n+i-12)]
x=arima.sim(model=list(ar=c(0.8,-0.5),ma=c(1,0.8,1.8)),n.start=500,n=n+2,sd=1)
for(i in 16:18) X[i,]=x[(i-15):(n+i-16)]
x=arima.sim(model=list(ar=c(-0.7, -0.5), ma=c(-1, -0.8)),n.start=500,n=n+1,sd=1)
for(i in 19:20) X[i,]=x[(i-18):(n+i-19)]
# Generate y_t
A=matrix(runif(p*p, -3, 3), ncol=p)
Y=A%*%X
Y=t(Y)
Trans=segmentTS(Y, k0=5)
# The transformed series z_t
Z=Trans$X
# Identify the permutation mechanism
permutation=permutationFDR(Z,Beta=10^(-200))
permutation$Groups



