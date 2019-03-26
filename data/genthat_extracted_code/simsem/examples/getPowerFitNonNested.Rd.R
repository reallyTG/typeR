library(simsem)


### Name: getPowerFitNonNested
### Title: Find power in rejecting non-nested models based on the
###   differences in fit indices
### Aliases: getPowerFitNonNested getPowerFitNonNested-methods
###   getPowerFitNonNested,SimResult,SimResult,vector-method
###   getPowerFitNonNested,SimResult,SimResult,missing-method

### ** Examples

## Not run: 
##D # Model A: Factor 1 on Items 1-3 and Factor 2 on Items 4-8
##D loading.A <- matrix(0, 8, 2)
##D loading.A[1:3, 1] <- NA
##D loading.A[4:8, 2] <- NA
##D LY.A <- bind(loading.A, 0.7)
##D latent.cor <- matrix(NA, 2, 2)
##D diag(latent.cor) <- 1
##D RPS <- binds(latent.cor, "runif(1, 0.7, 0.9)")
##D RTE <- binds(diag(8))
##D CFA.Model.A <- model(LY = LY.A, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # Model B: Factor 1 on Items 1-4 and Factor 2 on Items 5-8
##D loading.B <- matrix(0, 8, 2)
##D loading.B[1:4, 1] <- NA
##D loading.B[5:8, 2] <- NA
##D LY.B <- bind(loading.B, 0.7)
##D CFA.Model.B <- model(LY = LY.B, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # The actual number of replications should be greater than 10.
##D Output.A.A <- sim(10, n=500, model=CFA.Model.A, generate=CFA.Model.A) 
##D Output.A.B <- sim(10, n=500, model=CFA.Model.B, generate=CFA.Model.A) 
##D Output.B.A <- sim(10, n=500, model=CFA.Model.A, generate=CFA.Model.B) 
##D Output.B.B <- sim(10, n=500, model=CFA.Model.B, generate=CFA.Model.B) 
##D 
##D # Find the power based on the derived cutoff for both models
##D getPowerFitNonNested(Output.B.A, Output.B.B, dat1Mod1=Output.A.A, dat1Mod2=Output.A.B)
##D 
##D # Find the power based on the AIC and BIC of 0 (select model B if Output.B.B has lower AIC or BIC)
##D getPowerFitNonNested(Output.B.A, Output.B.B, cutoff=c(AIC=0, BIC=0))
## End(Not run)



