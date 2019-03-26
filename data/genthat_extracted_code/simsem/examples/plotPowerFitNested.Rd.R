library(simsem)


### Name: plotPowerFitNested
### Title: Plot power of rejecting a nested model in a nested model
###   comparison by each fit index
### Aliases: plotPowerFitNested

### ** Examples

## Not run: 
##D # Null model: One-factor model
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # Alternative model: Two-factor model
##D loading.alt <- matrix(0, 6, 2)
##D loading.alt[1:3, 1] <- NA
##D loading.alt[4:6, 2] <- NA
##D LY.ALT <- bind(loading.alt, 0.7)
##D latent.cor.alt <- matrix(NA, 2, 2)
##D diag(latent.cor.alt) <- 1
##D RPS.ALT <- binds(latent.cor.alt, 0.7)
##D CFA.Model.ALT <- model(LY = LY.ALT, RPS = RPS.ALT, RTE = RTE, modelType="CFA")
##D 
##D # In reality, more than 10 replications are needed
##D Output.NULL.NULL <- sim(10, n=500, model=CFA.Model.NULL, generate=CFA.Model.NULL) 
##D Output.ALT.NULL <- sim(10, n=500, model=CFA.Model.NULL, generate=CFA.Model.ALT) 
##D Output.NULL.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.NULL) 
##D Output.ALT.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.ALT) 
##D 
##D # Plot the power based on the derived cutoff from the models analyzed on the null datasets
##D plotPowerFitNested(Output.ALT.NULL, Output.ALT.ALT, nullNested=Output.NULL.NULL, 
##D 	nullParent=Output.NULL.ALT)
##D 
##D # Plot the power by only CFI
##D plotPowerFitNested(Output.ALT.NULL, Output.ALT.ALT, nullNested=Output.NULL.NULL, 
##D 	nullParent=Output.NULL.ALT, usedFit="CFI")
##D 
##D # The example of continous varying sample size. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output.NULL.NULL2 <- sim(NULL, n=seq(50, 500, 5), model=CFA.Model.NULL, generate=CFA.Model.NULL) 
##D Output.ALT.NULL2 <- sim(NULL, n=seq(50, 500, 5), model=CFA.Model.NULL, generate=CFA.Model.ALT) 
##D Output.NULL.ALT2 <- sim(NULL, n=seq(50, 500, 5), model=CFA.Model.ALT, generate=CFA.Model.NULL) 
##D Output.ALT.ALT2 <- sim(NULL, n=seq(50, 500, 5), model=CFA.Model.ALT, generate=CFA.Model.ALT) 
##D 
##D # Plot logistic line for the power based on the derived cutoff from the null model 
##D # along sample size values
##D plotPowerFitNested(Output.ALT.NULL2, Output.ALT.ALT2, nullNested=Output.NULL.NULL2, 
##D 	nullParent=Output.NULL.ALT2)
##D 
##D # Plot scatterplot for the power based on the derived cutoff from the null model 
##D # along sample size values
##D plotPowerFitNested(Output.ALT.NULL2, Output.ALT.ALT2, nullNested=Output.NULL.NULL2, 
##D 	nullParent=Output.NULL.ALT2, logistic=FALSE)
##D 
##D # Plot scatterplot for the power based on the advanced CFI value
##D plotPowerFitNested(Output.ALT.NULL2, Output.ALT.ALT2, cutoff=c(CFI=-0.1), logistic=FALSE)
## End(Not run)



