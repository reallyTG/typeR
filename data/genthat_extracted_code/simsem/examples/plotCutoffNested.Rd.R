library(simsem)


### Name: plotCutoffNested
### Title: Plot sampling distributions of the differences in fit indices
###   between nested models with fit indices cutoffs
### Aliases: plotCutoffNested

### ** Examples

## Not run: 
##D # Nested model: One factor
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # Parent model: two factors
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
##D Output.NULL.NULL <- sim(10, n=500, model=CFA.Model.NULL) 
##D Output.NULL.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.NULL)
##D 
##D # Plot the cutoffs in nested model comparison
##D plotCutoffNested(Output.NULL.NULL, Output.NULL.ALT, alpha=0.05)
## End(Not run)



