library(simsem)


### Name: plotPowerFitNonNested
### Title: Plot power of rejecting a non-nested model based on a difference
###   in fit index
### Aliases: plotPowerFitNonNested

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
##D # Plot the power based on the derived cutoff for both models
##D plotPowerFitNonNested(Output.B.A, Output.B.B, dat1Mod1=Output.A.A, dat1Mod2=Output.A.B)
##D 
##D # Plot the power based on AIC and BIC cutoffs
##D plotPowerFitNonNested(Output.B.A, Output.B.B, cutoff=c(AIC=0, BIC=0))
## End(Not run)



