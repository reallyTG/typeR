library(cmce)


### Name: calibrate
### Title: Fit the calibration model.
### Aliases: calibrate

### ** Examples

library(cmce)

set.seed(7)

# n is the number of observation locations on the spatial-temporal grid
# m is the number of simulation model runs at parameter settings theta_1,...,theta_m
# ns is the number of simulator states.
# sd.field is the std. deviation of the iid normal measurement error for the field data yf.
n=20
m=5 
ns=1
sd.field=0.1

# Just a 1D example:
x=seq(0,1,length=n)

# the nxm model output matrix:
phi=matrix(0,nrow=n,ncol=m+1)
calisettings=matrix(runif(m+1)*5,ncol=1)
r=getranges(calisettings)
k=ncol(calisettings)

# Our "unknown" theta on original scale and transformed to [0,1]:
theta.orig=2.1
calisettings[m+1]=theta.orig
design=scaledesign(calisettings,r)
theta=design[m+1]

# Generate reality - bang!
X=expand.grid(x,design)
l.gen=makedistlist(X)
rho=c(0.2,0.01)
muv=rep(0,(m+1)*n)
lambdav=1/2
surface=gp.realize(l.gen,muv,lambdav,rho)


# phi matrix
phi=matrix(surface,ncol=m+1,nrow=n)

## Not run: 
##D # When phi is a matrix as above, the code performs deterministic calibration.
##D # To perform calibration for a stochastic simulator with, say, M available realizations,
##D # replace phi with a list of matrices:
##D phi=vector("list",M)
##D for(i in 1:M) phi[[i]]=matrix(realization[[i]],ncol=m+1,nrow=n)
## End(Not run)



# Do some plots:
plot(x,phi[,1],pch=20,ylim=c(-4,4),xlab="x",ylab="response")
for(i in 2:(m+1)) points(x,phi[,i],pch=20)
points(x,phi[,m+1],col="green",pch=20)


# setup
nc=2 # dimension reduction by only retaining nc components of the svd decomposition. 
     # Must have nc>=2.
th.init=rep(0,k)
# matrix with all the calibration parameter settings and the last row will be filled 
# in with the estimate of theta during MCMC:
design.w=matrix(c(design[1:m],th.init),ncol=1)


# These matrices are (m+1)x(m+1).  The upper-left mxm matrix is the one used for 
# fitting gp's to the weights V.
l.v=makedistlist(design.w)


# we have the true theta stored, we no longer need it in calisettings
calisettings=calisettings[1:m,,drop=FALSE]


# Calibration parameter priors
thetaprior=NULL # use default uniform priors automatically constructed in cal.r


# Fake field data:
yf=phi[,m+1]+rnorm(n,sd=sd.field)


# For additive discrepancy:
l.d=makedistlist(x)
q=1
p=1
inidelta=rep(0,n)


# Specify Normal priors for the multiplicative discrepancies
inikap1=1
lamkap1=Inf


# State indices, since we only have 1 state this is trivial
is1=1:n


# setup pinfo and mh:
pinfo=list(l.v=l.v,l.d=l.d,n=n,m=m,q=k,p=p,nc=nc,ranges=r,thetaprior=thetaprior,
      ns=ns,six=list(is1=is1),inidelta=inidelta,
      lambdav=list(a=rep(10,nc),b=rep(0.1,nc)),
      lambdad=list(a=c(10),b=c(0.1)),
      mukap=c(inikap1),
      lambdakap=c(lamkap1),
      lambdaf=list(a=c(10),b=c(.5)),
      rho=list(a=5,b=1),
      psis=list(a=rep(2,p),b=rep(10,p)),
      delta.corrmodel="gaussian", eps=1e-10)
mh=list(rr=0.1, rp=0.1, rth=0.2)



# Run
N=2000   # Number of iterations, first 50% are used for adaptation
last=499 # Save these last draws as samples.  The N*50%-last are discarded burn-in.
fit=calibrate(yf,phi,N,pinfo,mh,last=last)



# Plot result
par(mfrow=c(1,2),pty="s")
# plot theta's
plot(density(unscalemat(fit$theta,r)),xlim=c(0,5),cex.lab=1.2,cex.axis=0.8,
    xlab=expression(theta),main="")
abline(v=theta.orig,lwd=2,lty=3)
# Next, the response and discrepancy:
plot(x,yf,col="pink",pch=20,xlim=c(0,1),ylim=c(-3,2),cex.lab=1.2,cex.axis=0.8,main="",
    ylab="response")
ix=seq(1,last,length=100)
for(i in 1:m) lines(x,phi[,i],col="grey",lwd=2)
for(i in ix) lines(x,fit$delta[i,],col="green")
for(i in ix) lines(x,fit$phi[[i]][,m+1])
for(i in ix) lines(x,fit$phi[[i]][,m+1]+fit$delta[i,],col="red",lty=3)
points(x,yf,col="pink",pch=20)
abline(h=0,lty=3)
legend(0.0,2,cex=.5,lwd=c(1,1,1,1),legend=c("emulator","discrepancy","predictive",
    "outputs"),col=c("black","green","red","grey"))




