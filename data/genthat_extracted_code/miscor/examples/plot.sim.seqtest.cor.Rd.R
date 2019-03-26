library(miscor)


### Name: plot.sim.seqtest.cor
### Title: Plot sim.seqtest
### Aliases: plot.sim.seqtest.cor

### ** Examples

## Not run: 
##D 
##D #---------------------------------------------
##D # Determine optimal k and nominal type-II-risk
##D # H0: rho <= 0.3, H1: rho > 0.3
##D # alpha = 0.01, beta = 0.05, delta = 0.25
##D 
##D # Step 1: Determine the optimal size of subsamples (k)
##D 
##D sim.obj.1 <- sim.seqtest.cor(rho.sim = 0.3, k = seq(4, 16, by = 1), rho = 0.3,
##D                              alternative = "greater",
##D                              delta = 0.25, alpha = 0.05, beta = 0.05,
##D                              runs = 10000)
##D 
##D plot(sim.obj.1)
##D 
##D # Step 2: Determine the optimal nominal type-II-risk based on
##D #         the optimal size of subsamples (k) from step 1
##D 
##D sim.obj.2 <- sim.seqtest.cor(rho.sim = 0.55, k = 16, rho = 0.3,
##D                              alternative = "greater",
##D                              delta = 0.25, alpha = 0.05, beta = seq(0.05, 0.15, by = 0.01),
##D                              runs = 10000)
##D 
##D plot(sim.obj.2)
## End(Not run)



