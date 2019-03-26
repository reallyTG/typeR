library(simsem)


### Name: getCutoffNested
### Title: Find fit indices cutoff for nested model comparison given a
###   priori alpha level
### Aliases: getCutoffNested

### ** Examples

## Not run: 
##D # Nested Model
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D 
##D error.cor.mis <- matrix("rnorm(1, 0, 0.1)", 6, 6)
##D diag(error.cor.mis) <- 1
##D RTE <- binds(diag(6), misspec=error.cor.mis)
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # Parent Model
##D loading.alt <- matrix(0, 6, 2)
##D loading.alt[1:3, 1] <- NA
##D loading.alt[4:6, 2] <- NA
##D LY.ALT <- bind(loading.alt, 0.7)
##D latent.cor.alt <- matrix(NA, 2, 2)
##D diag(latent.cor.alt) <- 1
##D RPS.ALT <- binds(latent.cor.alt, "runif(1, 0.7, 0.9)")
##D CFA.Model.ALT <- model(LY = LY.ALT, RPS = RPS.ALT, RTE = RTE, modelType="CFA")
##D 
##D # The actual number of replications should be greater than 10.
##D Output.NULL.NULL <- sim(10, n=500, model=CFA.Model.NULL, generate=CFA.Model.NULL)
##D Output.NULL.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.NULL)
##D 
##D # Find the fix index cutoff from the sampling distribution of the difference
##D # in fit index of nested models where the alpha is 0.05.
##D getCutoffNested(Output.NULL.NULL, Output.NULL.ALT, alpha=0.05)
## End(Not run)



