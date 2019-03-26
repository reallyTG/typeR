library(gsarima)


### Name: arrep
### Title: Compute the Autoregressive Representation of a Sarima Model
### Aliases: arrep
### Keywords: ts

### ** Examples

phi<-c(0.5, 0.3, 0.1)
theta<-c(0.6, 0.2, 0.2)
ar<-arrep(phi=phi, theta=theta, frequency=12)
check<-(acf2AR(ARMAacf(ar=phi, ma=theta, lag.max = 100, pacf = FALSE))[100,1:length(ar)])
as.data.frame(cbind(ar,check))

phi<-c(0.2,0.5)
theta<-c(0.4)
Phi<-c(0.6)
Theta<-c(0.3)
d<-2
D<-1
frequency<-12
ar<-arrep(phi=phi, theta=theta, Phi=Phi, Theta=Theta, frequency= frequency, d=d, D=D)
N<-500
intercept<-10
data.sim <- garsim(n=(N+length(ar)),phi=ar, X=matrix(rep(intercept,(N+ length(ar)))),
beta=1, sd=1) 
y<-data.sim[1+length(ar): (N+length(ar))]
tsy<-ts(y, freq= frequency)
plot(tsy)
arima(tsy, order=c(2,2,1), seasonal=list(order=c(1,1,1)))



