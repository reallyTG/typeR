library(updog)


### Name: wem
### Title: Generalized version of 'uni_em'.
### Aliases: wem

### ** Examples

set.seed(2)
n <- 3
p <- 5
lmat <- matrix(stats::runif(n * p), nrow = n)
weight_vec <- seq_len(p)
pi_init <- stats::runif(n)
pi_init <- pi_init / sum(pi_init)
wem(weight_vec = weight_vec,
    lmat       = lmat,
    pi_init    = pi_init,
    lambda     = 0,
    itermax    = 100,
    obj_tol    = 10^-6)




