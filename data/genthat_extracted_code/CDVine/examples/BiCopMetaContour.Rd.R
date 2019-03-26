library(CDVine)


### Name: BiCopMetaContour
### Title: Contour plot of bivariate meta distribution with different
###   margins and copula (theoretical and empirical)
### Aliases: BiCopMetaContour

### ** Examples

## Example 1: contour plot of meta Gaussian copula distribution
## with Gaussian margins
tau = 0.5
fam = 1
theta = BiCopTau2Par(fam,tau)	
BiCopMetaContour(u1=NULL,u2=NULL,bw=1,size=100,
                 levels=c(0.01,0.05,0.1,0.15,0.2),
                 family=fam,par=theta,main="tau=0.5")


## Example 2: empirical contour plot with standard normal margins
dat = BiCopSim(N=1000,fam,theta)
BiCopMetaContour(dat[,1],dat[,2],bw=2,size=100,
                 levels=c(0.01,0.05,0.1,0.15,0.2),
                 par=0,family="emp",main="N=1000")

# empirical contour plot with exponential margins
BiCopMetaContour(dat[,1],dat[,2],bw=2,size=100,
                 levels=c(0.01,0.05,0.1,0.15,0.2),
                 par=0,family="emp",main="n=500",
                 margins="exp",margins.par=1)



