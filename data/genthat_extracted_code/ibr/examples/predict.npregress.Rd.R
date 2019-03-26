library(ibr)


### Name: predict.npregress
### Title: Predicted values using using local polynomials
### Aliases: predict.npregress
### Keywords: smooth multivariate

### ** Examples

f <- function(x){sin(5*pi*x)}
n <- 100
x <- runif(n)
z <- f(x)
sigma2 <- 0.05*var(z)
erreur<-rnorm(n,0,sqrt(sigma2))
y<-z+erreur
grid <- seq(min(x),max(x),length=500)
res <- npregress(x,y,bandwidth=0.02,control.par=list(degree=1))
plot(x,y)
lines(grid,predict(res,grid))



