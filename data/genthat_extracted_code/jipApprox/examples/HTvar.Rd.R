library(jipApprox)


### Name: HTvar
### Title: Variance of the Horvitz-Thompson estimator
### Aliases: HTvar

### ** Examples


### Generate population data ---
N <- 500; n <- 50

set.seed(0)
x <- rgamma(500, scale=10, shape=5)
y <- abs( 2*x + 3.7*sqrt(x) * rnorm(N) )

pik  <- n * x/sum(x)
pikl <- jip_approx(pik, method='Hajek')

### Dummy sample ---
s   <- sample(N, n)


### Compute Variance ---
HTvar(y=y, pikl=pikl, sample=FALSE, method="HT")
HTvar(y=y, pikl=pikl, sample=FALSE, method="SYG")


### Estimate Variance ---
#' HTvar(y=y[s], pikl=pikl[s,s], sample=TRUE, method="HT")
#' HTvar(y=y[s], pikl=pikl[s,s], sample=TRUE, method="SYG")





