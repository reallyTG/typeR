library(Sim.DiffProc)


### Name: HWV
### Title: Hull-White/Vasicek, Ornstein-Uhlenbeck process
### Aliases: HWV OU HWV.default OU.default
### Keywords: sde ts

### ** Examples

## Hull-White/Vasicek Models
## dX(t) = 4 * (2.5 - X(t)) * dt + 1 *dW(t), X0=10
set.seed(1234)

X <- HWV(N=1000,M=10,mu = 4, theta = 2.5,sigma = 1,x0=10)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")

## Ornstein-Uhlenbeck Process
## dX(t) = -4 * X(t) * dt + 1 *dW(t) , X0=2
set.seed(1234)

X <- OU(N=1000,M=10,mu = 4,sigma = 1,x0=10)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")



