library(lavaSearch2)


### Name: intDensTri
### Title: Integrate a Gaussian/Student Density over a Triangle
### Aliases: intDensTri

### ** Examples

library(mvtnorm)

p <- 2
Sigma <- diag(p)
mu <- rep(0, p)

## bivariate normal distribution
z2 <- qmvt(0.975, mean = mu, sigma = Sigma, df = 1e3)$quantile

# compute integral
intDensTri(mu = mu, Sigma = Sigma, n=5, x.min=0, type = "fine")$value-1/2
intDensTri(mu = mu, Sigma = Sigma, n=30, x.min=0, type = "raw")$value-1/2
intDensTri(mu = mu, Sigma = Sigma, n=50, x.min=0, type = "raw")$value-1/2

intDensTri(mu = mu, Sigma = Sigma, df = 5, n=5, x.min=0, distribution = "pmvt")$value-1/2
res <- intDensTri(mu = mu, Sigma = Sigma, df = 5, n=10, x.min=0, distribution = "pmvt")
res$value-1/2
ggplot2::autoplot(res)

## trivariate normal distribution
## Not run: 
##D p <- 3
##D Sigma <- diag(p)
##D mu <- rep(0, p)
##D 
##D res2 <- intDensTri(mu = mu, Sigma = Sigma, n=5, x.min = 0, z.max = 10)
##D ggplot2::autoplot(res2)
##D ggplot2::autoplot(res2, coord.plot = c("x","z1"))
##D res2
## End(Not run)

#### when the distribution is far from 0
## Not run: 
##D eq1 <- intDensTri(mu = c(10,0), Sigma = diag(1,2), 
##D                   x.min = 2, n=10)
##D eq1$value-1
##D ggplot2::autoplot(eq1)
##D 
##D eq2 <- intDensTri(mu = c(10,0,0), Sigma = diag(1,3),
##D                   x.min=2, z.max = 10, type = "raw",
##D                   n=10)
##D ggplot2::autoplot(eq2, coord.plot = c("y1","z1"))
##D eq2$value-1
##D 
##D ## more variables
##D p <- 5
##D Sigma <- diag(p)
##D mu <- rep(0, p)
##D 
##D res2 <- intDensTri(mu = mu, Sigma = Sigma, n=5, x.min = 1, z.max = c(2,2))
##D res2$grid
## End(Not run)




