library(Renext)


### Name: fmaxlo
### Title: ML estimation of a 'maxlo' distribution
### Aliases: fmaxlo

### ** Examples

## generate sample
set.seed(1234)
n <- 200
alpha <- 2 + rexp(1)
beta <- 1 + rexp(1)
x <- rmaxlo(n, scale = beta, shape = alpha)
res <- fmaxlo(x, plot = TRUE)

## compare with a GPD with shape 'xi' and scale 'sigma'
xi <- -1 / alpha; sigma <- -beta * xi
res.evd <- evd::fpot(x, threshold = 0, model = "gpd")
xi.evd <- res.evd$estimate["shape"]
sigma.evd <- res.evd$estimate["scale"]
beta.evd <- -sigma.evd / xi.evd 
alpha.evd <- -1 / xi.evd
cbind(Renext = res$estimate, evd = c(alpha = alpha.evd, beta = beta.evd))
  




