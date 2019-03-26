library(simsem)


### Name: plotPowerFit
### Title: Plot sampling distributions of fit indices that visualize power
###   of rejecting datasets underlying misspecified models
### Aliases: plotPowerFit

### ** Examples

## Not run: 
##D # Null model: One factor model
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output.NULL <- sim(50, n=50, model=CFA.Model.NULL, generate=CFA.Model.NULL) 
##D 
##D # Alternative model: Two-factor model
##D loading.alt <- matrix(0, 6, 2)
##D loading.alt[1:3, 1] <- NA
##D loading.alt[4:6, 2] <- NA
##D LY.ALT <- bind(loading.alt, 0.7)
##D latent.cor.alt <- matrix(NA, 2, 2)
##D diag(latent.cor.alt) <- 1
##D RPS.ALT <- binds(latent.cor.alt, 0.5)
##D CFA.Model.ALT <- model(LY = LY.ALT, RPS = RPS.ALT, RTE = RTE, modelType="CFA")
##D Output.ALT <- sim(50, n=50, model=CFA.Model.NULL, generate=CFA.Model.ALT)
##D 
##D # Plot the power based on derived cutoff from the null model using four fit indices
##D plotPowerFit(Output.ALT, nullObject=Output.NULL, alpha=0.05, 
##D 	usedFit=c("RMSEA", "CFI", "TLI", "SRMR"))
##D 
##D # Plot the power of rejecting null model when the rule of thumb from Hu & Bentler (1999) is used
##D Rule.of.thumb <- c(RMSEA=0.05, CFI=0.95, TLI=0.95, SRMR=0.06)
##D plotPowerFit(Output.ALT, cutoff=Rule.of.thumb, alpha=0.05, 
##D 	usedFit=c("RMSEA", "CFI", "TLI", "SRMR"))
##D 
##D # The example of continous varying sample size. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output.NULL2 <- sim(NULL, n=seq(50, 250, 25), model=CFA.Model.NULL, generate=CFA.Model.NULL)
##D Output.ALT2 <- sim(NULL, n=seq(50, 250, 25), model=CFA.Model.NULL, generate=CFA.Model.ALT)
##D 
##D # Plot the power based on derived cutoff from the null model using four fit indices 
##D # along sample size
##D plotPowerFit(Output.ALT2, nullObject=Output.NULL2, alpha=0.05, 
##D 	usedFit=c("RMSEA", "CFI", "TLI", "SRMR"))
##D 
##D # Plot the power based on rule of thumb along sample size
##D plotPowerFit(Output.ALT2, cutoff=Rule.of.thumb, alpha=0.05, 
##D 	usedFit=c("RMSEA", "CFI", "TLI", "SRMR"))
## End(Not run)



