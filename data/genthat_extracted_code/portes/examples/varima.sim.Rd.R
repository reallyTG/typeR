library(portes)


### Name: varima.sim
### Title: Simulate Data From Seasonal/Nonseasonal
###   ARIMA(p,d,q)*(ps,ds,qs)_s or VARIMA(p,d,q)*(ps,ds,qs)_s Models
### Aliases: varima.sim
### Keywords: ts

### ** Examples

#################################################################################
# Simulate white noise series from a Gaussian distribution                      #
#################################################################################
set.seed(1234)
Z1 <- varima.sim(n=400)       ## a univariate series
plot(Z1)
Z2 <- varima.sim(n=400,k=2)   ## a bivariate series
plot(Z2)
Z3 <- varima.sim(n=400,k=5)   ## a multivariate series of dimension 5
plot(Z3)
#################################################################################
# Simulate MA(1) where innovation series is provided via argument innov         #
#################################################################################
set.seed(1234)
n <- 200
theta <-  0.6
Z<-varima.sim(list(ma=theta),n=n,innov=rnorm(n),innov.dist="bootstrap")
plot(Z)
#################################################################################
# Simulate seasonal ARIMA(2,1,0)*(0,2,1)_12 process with phi=c(1.3,-0.35),      #
# theta.season = 0.8. Gaussian innovations. The series is truncated at lag 50   #
#################################################################################
set.seed(12834)
n <- 100
phi <- c(1.3, -0.35)
theta.season <- 0.8
Z<-varima.sim(list(ar=phi,d=1,sma=theta.season,D=2),n=n,trunc.lag=50)
plot(Z)
acf(Z)
#################################################################################
# Simulate seasonal ARMA(0,0,0)*(2,0,0)_4 process with intercept = 0.8          #
# phi.season = c(0.9,-0.9), period = 4, t5-distribution innovations with df = 3 #
#################################################################################
set.seed(1234)
n <- 200
phi.season <- c(0.9,-0.9)
Z<-varima.sim(list(sar=phi.season,period=4),n=n,constant=0.8,innov.dist="t",dft=3)
plot(Z)
acf(Z)
arima(Z,order=c(0,0,0),seasonal = list(order = c(2,0,0),period=4))
#################################################################################
# Simulate univariate ARMA(2,1) process with length 500,                        #
# phi = c(1.3, -0.35), theta = 0.1. Drift equation is 8 + 0.05*t                #
# Stable innovations with: Alpha = 1.75, Beta = 0, Scale = 1, Location = 0      #
#################################################################################
set.seed(1234)
n <- 500
phi <-  c(1.3, -0.35)
theta <-  0.1
Alpha <- 1.75
Beta <- 0
Scale <- 1
Location <- 0
Stable <- c(Alpha,Beta,Scale,Location)
Z <- varima.sim(list(ar=phi,ma=theta),n=n,constant=8,trend=0.05,demean=0,
     innov.dist="stable",par.stable=Stable)
plot(Z)
#################################################################################
# Simulate a bivariate white noise series from a multivariate t4-distribution   #
# Then use the nonparametric bootstrap method to generate a seasonal SVARIMA    #
# of order (0,d,0)*(0,0,1)_12 with d = c(1, 0), n= 250, k = 2, and              #
# theta.season=array(c(0.5,0.4,0.1,0.3),dim=c(k,k,1))                           #
#################################################################################
set.seed(1234)
Z1 <- varima.sim(n=250,k=2,innov.dist="t",dft=4)
theta.season=array(c(0.5,0.4,0.1,0.3),dim=c(2,2,1)) 
Z2 <- varima.sim(list(sma=theta.season,d=c(1,0)),n=250,k=2,
                 innov=Z1,innov.dist="bootstrap")
plot(Z2)
#################################################################################
# Simulate a bivariate VARIMA(2,d,1) process with length 300, where d=(1,2).    #
# phi = array(c(0.5,0.4,0.1,0.5,0,0.3,0,0),dim=c(k,k,2)),                       #
# theta = array(c(0,0.25,0,0), dim=c(k,k,1)).                                   #
# innovations are generated from multivariate normal                            #
# The process have mean zero and no deterministic terms.                        #
# The variance covariance is sigma = matrix(c(1,0.71,0.71,2),2,2).              #
# The series is truncated at default value: trunc.lag=ceiling(100/3)=34         #
#################################################################################
set.seed(1234)
k <- 2
n <- 300 
phi <-  array(c(0.5,0.4,0.1,0.5,0,0.3,0,0),dim=c(k,k,2))
theta <-  array(c(0,0.25,0,0),dim=c(k,k,1))
d <- c(1,2)
sigma <- matrix(c(1,0.71,0.71,2),k,k)
Z <- varima.sim(list(ma=phi,ma=theta,d=d),n=n,k=2,sigma=sigma)
plot(Z)
#################################################################################
# Simulate a trivariate Vector SVARMA(1,0,0)*(1,0,0)_12 process with length 300 #
# phi = array(c(0.5,0.4,0.1,0.5,0,0.3,0,0,0.1), dim=c(k,k,1)), where k =3       #
# phi.season = array(c(0,0.25,0,0.5,0.1,0.4,0,0.25,0.6), dim=c(k,k,1)).         #
# innovations are generated from multivariate normal distribution               #
# The process have mean c(10, 0, 12),                                           #
# Drift equation a + b * t, where a = c(2,1,5), and b = c(0.01,0.06,0)          #
# The series is truncated at default value: trunc.lag=ceiling(100/3)=34         #
#################################################################################
set.seed(1234)
k <- 3
n <- 300
phi <-  array(c(0.5,0.4,0.1,0.5,0,0.3,0,0,0.1),dim=c(k,k,1))
phi.season <-  array(c(0,0.25,0,0.5,0.1,0.4,0,0.25,0.6),dim=c(k,k,1))
constant <- c(2,1,5)
trend <- c(0.01,0.06,0)
demean <- c(10,0,12)
Z <- varima.sim(list(ar=phi,sar=phi.season),n=n,k=3,constant=constant,
trend=trend,demean=demean)
plot(Z)
acf(Z)
#################################################################################
# Simulate a bivariate VAR(1) process with length 600.                          #
# Stable dist.: Alpha=(1.3,1.6), Beta=(0,0.2), Scale=(1,1), Location=(0,0.2)    #
# The series is truncated at default value: trunc.lag=min(100,200)=100          #
#################################################################################
set.seed(1234)
k <- 2
n <- 600
phi <- array(c(-0.2,-0.6,0.3,1.1),dim=c(k,k,1))
theta <- array(c(1,-0.2,0.71,0.2),dim=c(k,k,1))
Alpha <- c(1.3,1.6)
Beta <- c(0,0.2)
Scale <-c(1,1)
Location <-c(0,0.2)
Stable <- c(Alpha,Beta,Scale,Location)
Z<-varima.sim(list(ar=phi,ma=theta),n=n,k=2,innov.dist="stable",par.stable=Stable)
plot(Z)



