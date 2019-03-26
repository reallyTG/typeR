library(yuima)


### Name: subsampling
### Title: subsampling
### Aliases: subsampling
### Keywords: ts

### ** Examples

## Set a model
diff.coef.1 <- function(t, x1=0, x2) x2*(1+t)
diff.coef.2 <- function(t, x1, x2=0) x1*sqrt(1+t^2)
cor.rho <- function(t, x1=0, x2=0) sqrt((1+cos(x1*x2))/2)
diff.coef.matrix <- matrix(c("diff.coef.1(t,x1,x2)",
"diff.coef.2(t,x1,x2)*cor.rho(t,x1,x2)", "",
"diff.coef.2(t,x1,x2)*sqrt(1-cor.rho(t,x1,x2)^2)"),2,2)
cor.mod <- setModel(drift=c("",""), diffusion=diff.coef.matrix, 
solve.variable=c("x1", "x2"), xinit=c(3,2))
set.seed(111)

## We first simulate the two dimensional diffusion model
yuima.samp <- setSampling(Terminal=1, n=1200)
yuima <- setYuima(model=cor.mod, sampling=yuima.samp)
yuima.sim <- simulate(yuima)

plot(yuima.sim, plot.type="single")

## random sampling with exponential times
## one random sequence per time series
newsamp <- setSampling(
 random=list(rdist=c( function(x) rexp(x, rate=10), 
  function(x) rexp(x, rate=20))) )
newdata <- subsampling(yuima.sim, sampling=newsamp)
points(get.zoo.data(newdata)[[1]],col="red")
points(get.zoo.data(newdata)[[2]],col="green")


plot(yuima.sim, plot.type="single")

## deterministic subsampling with different
## frequence for each time series
newsamp <- setSampling(delta=c(0.1,0.2))
newdata <- subsampling(yuima.sim, sampling=newsamp)
points(get.zoo.data(newdata)[[1]],col="red")
points(get.zoo.data(newdata)[[2]],col="green")



