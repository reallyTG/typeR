library(ibr)


### Name: npregress
### Title: Local polynomials smoothing
### Aliases: npregress print.npregress residuals.npregress
### Keywords: smooth multivariate

### ** Examples

f <- function(x){sin(5*pi*x)}
n <- 100
x <- runif(n)
z <- f(x)
sigma2 <- 0.05*var(z)
erreur <- rnorm(n,0,sqrt(sigma2))
y <- z+erreur
res <- npregress(x,y,bandwidth=0.02)
summary(res)
ord <- order(x)
plot(x,y)
lines(x[ord],predict(res)[ord])



