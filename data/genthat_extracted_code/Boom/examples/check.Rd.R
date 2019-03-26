library(Boom)


### Name: check
### Title: Check MCMC Output
### Aliases: CheckMcmcMatrix CheckMcmcVector

### ** Examples


ndraws <- 100
draws <- rnorm(ndraws, 0, 1)
CheckMcmcVector(draws, 0)  ## Returns TRUE
CheckMcmcVector(draws, 17)  ## Returns FALSE

draws <- matrix(nrow = ndraws, ncol = 5)
for (i in 1:5) {
  draws[, i] <- rnorm(ndraws, i, 1)
}  
CheckMcmcMatrix(draws, truth = 1:5)  ## Returns TRUE
CheckMcmcMatrix(draws, truth = 5:1)  ## Returns FALSE




