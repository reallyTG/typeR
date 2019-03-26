library(CLME)


### Name: lrt.stat
### Title: Likelihood ratio type statistic (global)
### Aliases: lrt.stat

### ** Examples

data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )

clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

# Individually compute lrt statistic
lrt.stat(clme.out$theta, clme.out$theta.null, clme.out$cov.theta )




