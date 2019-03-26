library(pomp)


### Name: ou2
### Title: Two-dimensional discrete-time Ornstein-Uhlenbeck process
### Aliases: ou2
### Keywords: models datasets

### ** Examples

pompExample(ou2)
plot(ou2)
coef(ou2)
x <- simulate(ou2)
plot(x)
pf <- pfilter(ou2,Np=1000)
logLik(pf)



