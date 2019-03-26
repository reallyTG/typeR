library(gsarima)


### Name: garsim
### Title: Simulate a Generalized Autoregressive Time Series
### Aliases: garsim
### Keywords: ts

### ** Examples

  N<-1000
  ar<-c(0.8)
  intercept<-2
  frequency<-1
  x<- rnorm(N)
  beta.x<-0.7
  #Gaussian simulation with covariate
  X=matrix(c(rep(intercept, N+length(ar)), rep(0, length(ar)), x), ncol=2)
  y.sim <- garsim(n=(N+length(ar)),phi=ar, X=X, beta=c(1,beta.x), sd=sqrt(1)) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  arima(tsy, order=c(1,0,0), xreg=x)

  #Gaussian simulation with covariate and deterministic seasonality through first order harmonic
  ar<-c(1.4,-0.4)
  frequency<-12
  beta.x<-c(0.7,4,4)
  X<-matrix(nrow= (N+ length(ar)), ncol=3)
  for (t in 1: length(ar)){
	X[t,1]<-0
	X[t,2]<-sin(2*pi*(t- length(ar))/frequency)
	X[t,3]<- cos(2*pi*(t- length(ar))/frequency)
  }
  for (t in (1+ length(ar)): (N+ length(ar))){
	X[t,1]<-x[t- length(ar)]
	X[t,2]<-sin(2*pi*(t- length(ar))/frequency)
	X[t,3]<- cos(2*pi*(t- length(ar))/frequency)
  }
  y.sim <- garsim(n=(N+length(ar)),phi=ar, X=X, beta= beta.x, sd=sqrt(1)) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  Xreg<-matrix(nrow= N, ncol=3)
  for (t in 1: N){
	Xreg[t,1]<-x[t]
	Xreg[t,2]<-sin(2*pi*t/frequency)
	Xreg[t,3]<- cos(2*pi*t/frequency)
  }
  arimares<-arima(tsy, order=c(1,1,0), xreg=Xreg)
  tsdiag(arimares)
  arimares

  #Negative binomial simulation with covariate
  ar<-c(0.8)
  frequency<-1
  beta.x<-0.7
  X=matrix(c(rep(log(intercept), N+length(ar)), rep(0, length(ar)), x), ncol=2)
  y.sim <- garsim(n=(N+length(ar)), phi=ar, beta=c(1,beta.x), link= "log", 
  	family= "negative.binomial", zero.correction = "zq1", c=1, theta=5, X=X) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  library(gamlss.util)
  m10<-garmaFit(y~x-1, order=c(1,0), family=NBI, alpha=1)
  sm10<-summary(m10)
  sm10
  1/sm10$sigma #compare with theta specified for negative binomial
  
    
  #Poisson ARMA(1,1) with identity link and negative auto correlation
  N<-500
  phi<-c(-0.8)
  theta<-c(0.6)
  ar<-arrep(phi=phi, theta=theta)
  check<-(acf2AR(ARMAacf(ar=phi, ma=theta, lag.max = 100, pacf = FALSE))[100,1:length(ar)])
  as.data.frame(cbind(ar,check))
  intercept<-100
  frequency<-1
  X=matrix(c(rep(intercept, N+length(ar))), ncol=1)
  y.sim <- garsim(n=(N+length(ar)), phi=ar, beta=c(1), link= "identity", 
  	family= "poisson", minimum = -100, X=X) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  
  #Poisson AR(1) with identity link and negative auto correlation
  N<-1000
  ar<-c(-0.8)
  intercept<-100
  frequency<-1
  X=matrix(c(rep(intercept, N+length(ar))), ncol=1)
  y.sim <- garsim(n=(N+length(ar)), phi=ar, beta=c(1), link= "identity", 
  	family= "poisson", minimum = -100, X=X) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  
  #Example of negative binomial GSARIMA(2,1,0,0,0,1)x
  phi<-c(0.5,0.2)
  theta<-c(0)
  Theta<-c(0.5)
  Phi<-c(0)
  d<-c(1)
  D<-c(0)
  frequency<-12
  ar<-arrep(phi=phi, theta=theta, Phi=Phi, Theta=Theta, frequency= frequency, d=d, D=D)
  N<-c(1000)
  intercept<-c(10)
  x<- rnorm(N)
  beta.x<-c(0.7)
  X<-matrix(c(rep(log(intercept), N+length(ar)), rep(0, length(ar)), x), ncol=2)
  c<-c(1)
  y.sim <- garsim(n=(N+length(ar)), phi=ar, beta=c(1,beta.x), link= "log", 
  	family= "negative.binomial", zero.correction = "zq1", c=c, theta=5, X=X) 
  y<-y.sim[(1+length(ar)):(N+length(ar))]
  tsy<-ts(y, freq=frequency)
  plot(tsy)
  plot(log(tsy))



