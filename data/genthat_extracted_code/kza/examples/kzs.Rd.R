library(kza)


### Name: kzs
### Title: Kolmogorov-Zurbenko Spline
### Aliases: kzs

### ** Examples

n <- 1000
x <- (1:n)/n
true<-((exp(2.5*x)+sin(25*x))-1)/3

noise <- rnorm(n)
y <- true + noise 

a<-kzs(y,m=60)

par(mfrow=c(2,1))
plot(y,type='l')
lines(true,col="red")

plot(a,type='l', ylim=c(-2,4))
lines(true,col="red")
par(mfrow=c(1,1))

################
# second example
################
t <- seq(from = -round(400*pi), to = round(400*pi), by = .25) 
ts <- 0.5*sin(sqrt((2*pi*abs(t))/200))
signal <- ifelse(t < 0, -ts, ts)
et <- rnorm(length(t), mean = 0, sd = 1)
yt <- et + signal

b<-kzs(yt,m=400)
par(mfrow=c(2,1))
plot(yt,type='l')
lines(signal,col="red")

plot(b,type='l', ylim=c(-0.5,1))
lines(signal,col="red")
par(mfrow=c(1,1))




