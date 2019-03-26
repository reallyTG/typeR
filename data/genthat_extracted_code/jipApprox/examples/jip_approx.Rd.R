library(jipApprox)


### Name: jip_approx
### Title: Approximate Joint-Inclusion Probabilities
### Aliases: jip_approx

### ** Examples


### Generate population data ---
N <- 20; n<-5

set.seed(0)
x <- rgamma(N, scale=10, shape=5)
y <- abs( 2*x + 3.7*sqrt(x) * rnorm(N) )

pik  <- n * x/sum(x)

### Approximate joint-inclusion probabilities ---
pikl <- jip_approx(pik, method='Hajek')
pikl <- jip_approx(pik, method='HartleyRao')
pikl <- jip_approx(pik, method='Tille')
pikl <- jip_approx(pik, method='Brewer1')
pikl <- jip_approx(pik, method='Brewer2')
pikl <- jip_approx(pik, method='Brewer3')
pikl <- jip_approx(pik, method='Brewer4')






