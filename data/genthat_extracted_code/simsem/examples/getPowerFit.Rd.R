library(simsem)


### Name: getPowerFit
### Title: Find power in rejecting alternative models based on fit indices
###   criteria
### Aliases: getPowerFit

### ** Examples

## Not run: 
##D # Null model with one factor
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output.NULL <- sim(5, n=500, model=CFA.Model.NULL)
##D 
##D # Get the fit index cutoff from the null model
##D Cut.NULL <- getCutoff(Output.NULL, 0.05)
##D 
##D # Alternative model with two factor
##D loading.alt <- matrix(0, 6, 2)
##D loading.alt[1:3, 1] <- NA
##D loading.alt[4:6, 2] <- NA
##D LY.ALT <- bind(loading.alt, 0.7)
##D latent.cor.alt <- matrix(NA, 2, 2)
##D diag(latent.cor.alt) <- 1
##D RPS.ALT <- binds(latent.cor.alt, "runif(1, 0.7, 0.9)")
##D CFA.Model.ALT <- model(LY = LY.ALT, RPS = RPS.ALT, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output.ALT <- sim(5, n=500, model=CFA.Model.NULL, generate=CFA.Model.ALT)
##D 
##D # Get the power based on the derived cutoff
##D getPowerFit(Output.ALT, cutoff=Cut.NULL)
##D 
##D # Get the power based on the rule of thumb proposed by Hu & Bentler (1999)
##D Rule.of.thumb <- c(RMSEA=0.05, CFI=0.95, TLI=0.95, SRMR=0.06)
##D getPowerFit(Output.ALT, cutoff=Rule.of.thumb, usedFit=c("RMSEA", "CFI", "TLI", "SRMR"))
##D 
##D # The example of continous varying sample size. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output.NULL2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.NULL, generate=CFA.Model.NULL)
##D Output.ALT2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.NULL, generate=CFA.Model.ALT)
##D 
##D # Get the power based on the derived cutoff from the null model at the sample size of 250
##D getPowerFit(Output.ALT2, nullObject=Output.NULL2, nVal=250)
## End(Not run)



