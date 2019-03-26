library(BNPdensity)


### Name: MixNRMI2
### Title: Normalized Random Measures Mixture of Type II
### Aliases: MixNRMI2
### Keywords: distribution models nonparametrics

### ** Examples

## Not run: 
##D ### Example 1
##D # Data
##D data(acidity)
##D x <- acidity
##D # Fitting the model under default specifications
##D out <- MixNRMI2(x)
##D # Plotting density estimate + 95##D 
##D attach(out)
##D m <- ncol(qx)
##D ymax <- max(qx[,m])
##D par(mfrow=c(1,1))
##D hist(x,probability=TRUE,breaks=20,col=grey(.9),ylim=c(0,ymax))
##D lines(xx,qx[,1],lwd=2)
##D lines(xx,qx[,2],lty=3,col=4)
##D lines(xx,qx[,m],lty=3,col=4)
##D detach()
## End(Not run)

### Example 2
## Do not run
# set.seed(150520)
# data(enzyme)
# x <- enzyme
#  Enzyme2.out <- MixNRMI2(x, Alpha = 1, Beta = 0.007, Gama = 0.5, 
#                          distr.k = 2, distr.py0 = 2,
#                          distr.pz0 = 2, mu.pz0 = 1, sigma.pz0 = 1, Meps=0.005,
#                          Nit = 5000, Pbi = 0.2)
# The output of this run is already loaded in the package
# To show results run the following
# Data
data(enzyme)
x <- enzyme
data(Enzyme2.out)
attach(Enzyme2.out)
# Plotting density estimate + 95% credible interval
m <- ncol(qx)
ymax <- max(qx[,m])
par(mfrow=c(1,1))
hist(x,probability=TRUE,breaks=20,col=grey(.9),ylim=c(0,ymax))
lines(xx,qx[,1],lwd=2)
lines(xx,qx[,2],lty=3,col=4)
lines(xx,qx[,m],lty=3,col=4)
# Plotting number of clusters
par(mfrow=c(2,1))
plot(R,type="l",main="Trace of R")
hist(R,breaks=min(R-0.5):max(R+0.5),probability=TRUE)
# Plotting u
par(mfrow=c(2,1))
plot(U,type="l",main="Trace of U")
hist(U,nclass=20,probability=TRUE,main="Histogram of U")
# Plotting cpo
par(mfrow=c(2,1))
plot(cpo,main="Scatter plot of CPO's")
boxplot(cpo,horizontal=TRUE,main="Boxplot of CPO's")
print(paste('Average log(CPO)=',round(mean(log(cpo)),4)))
print(paste('Median log(CPO)=',round(median(log(cpo)),4)))
detach()

### Example 3
## Do not run
# set.seed(150520)
# data(galaxy)
# x <- galaxy
#  Galaxy2.out <- MixNRMI2(x, Alpha = 1, Beta = 0.015, Gama = 0.5, 
#                          distr.k = 1, distr.py0 = 2,
#                          distr.pz0 = 2, mu.pz0 = 1, sigma.pz0 = 1,  Meps=0.005,
#                          Nit = 5000, Pbi = 0.2)
# The output of this run is already loaded in the package
# To show results run the following
# Data
data(galaxy)
x <- galaxy
data(Galaxy2.out)
attach(Galaxy2.out)
# Plotting density estimate + 95% credible interval
m <- ncol(qx)
ymax <- max(qx[,m])
par(mfrow=c(1,1))
hist(x,probability=TRUE,breaks=20,col=grey(.9),ylim=c(0,ymax))
lines(xx,qx[,1],lwd=2)
lines(xx,qx[,2],lty=3,col=4)
lines(xx,qx[,m],lty=3,col=4)
# Plotting number of clusters
par(mfrow=c(2,1))
plot(R,type="l",main="Trace of R")
hist(R,breaks=min(R-0.5):max(R+0.5),probability=TRUE)
# Plotting u
par(mfrow=c(2,1))
plot(U,type="l",main="Trace of U")
hist(U,nclass=20,probability=TRUE,main="Histogram of U")
# Plotting cpo
par(mfrow=c(2,1))
plot(cpo,main="Scatter plot of CPO's")
boxplot(cpo,horizontal=TRUE,main="Boxplot of CPO's")
print(paste('Average log(CPO)=',round(mean(log(cpo)),4)))
print(paste('Median log(CPO)=',round(median(log(cpo)),4)))
detach()



