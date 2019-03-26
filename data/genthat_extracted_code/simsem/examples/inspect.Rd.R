library(simsem)


### Name: inspect
### Title: Extract information from a simulation result
### Aliases: inspect,SimResult-method inspect

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 2)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D LY <- bind(loading, 0.7)
##D 
##D latent.cor <- matrix(NA, 2, 2)
##D diag(latent.cor) <- 1
##D RPS <- binds(latent.cor, 0.5)
##D 
##D RTE <- binds(diag(6))
##D 
##D VY <- bind(rep(NA,6),2)
##D 
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType = "CFA")
##D 
##D # In reality, more than 5 replications are needed.
##D Output <- sim(5, CFA.Model, n=200)
##D inspect(Output, "coef")
##D inspect(Output, "param")
##D inspect(Output, "se", improper = TRUE, nonconverged = TRUE)
## End(Not run)



