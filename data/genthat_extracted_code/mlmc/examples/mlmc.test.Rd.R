library(mlmc)


### Name: mlmc.test
### Title: Multi-level Monte Carlo estimation test suite
### Aliases: mlmc.test

### ** Examples

## Not run: 
##D # Example calls with realistic arguments
##D tst <- mlmc.test(opre_l, M=4, N=2000000,
##D                  L=5, N0=1000,
##D                  eps.v=c(0.005, 0.01, 0.02, 0.05, 0.1),
##D                  Lmin=2, Lmax=6, option=1)
##D tst
##D plot(tst)
##D 
##D tst <- mlmc.test(mcqmc06_l, M=2, N=20000,
##D                  L=8, N0=200,
##D                  eps.v=c(0.005, 0.01, 0.02, 0.05, 0.1),
##D                  Lmin=2, Lmax=10, option=1)
##D tst
##D plot(tst)
## End(Not run)

# Toy versions for CRAN tests
tst <- mlmc.test(opre_l, M=4, N=10000,
                 L=5, N0=1000,
                 eps.v=c(0.025, 0.1),
                 Lmin=2, Lmax=6, option=1)

tst <- mlmc.test(mcqmc06_l, M=2, N=10000,
                 L=8, N0=1000,
                 eps.v=c(0.025, 0.1),
                 Lmin=2, Lmax=10, option=1)




