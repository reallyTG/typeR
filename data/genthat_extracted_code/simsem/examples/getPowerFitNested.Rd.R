library(simsem)


### Name: getPowerFitNested
### Title: Find power in rejecting nested models based on the differences
###   in fit indices
### Aliases: getPowerFitNested

### ** Examples

## Not run: 
##D # Null model (Nested model) with one factor
##D loading.null <- matrix(0, 6, 1)
##D loading.null[1:6, 1] <- NA
##D LY.NULL <- bind(loading.null, 0.7)
##D RPS.NULL <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model.NULL <- model(LY = LY.NULL, RPS = RPS.NULL, RTE = RTE, modelType="CFA")
##D 
##D # Alternative model (Parent model) with two factors
##D loading.alt <- matrix(0, 6, 2)
##D loading.alt[1:3, 1] <- NA
##D loading.alt[4:6, 2] <- NA
##D LY.ALT <- bind(loading.alt, 0.7)
##D latent.cor.alt <- matrix(NA, 2, 2)
##D diag(latent.cor.alt) <- 1
##D RPS.ALT <- binds(latent.cor.alt, 0.7)
##D CFA.Model.ALT <- model(LY = LY.ALT, RPS = RPS.ALT, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 10 replications to save time.
##D # In reality, more replications are needed.
##D Output.NULL.NULL <- sim(10, n=500, model=CFA.Model.NULL, generate=CFA.Model.NULL) 
##D Output.ALT.NULL <- sim(10, n=500, model=CFA.Model.NULL, generate=CFA.Model.ALT) 
##D Output.NULL.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.NULL) 
##D Output.ALT.ALT <- sim(10, n=500, model=CFA.Model.ALT, generate=CFA.Model.ALT) 
##D 
##D # Find the power based on the derived cutoff from the models analyzed on the null datasets
##D getPowerFitNested(Output.ALT.NULL, Output.ALT.ALT, nullNested=Output.NULL.NULL, 
##D 	nullParent=Output.NULL.ALT)
##D 
##D # Find the power based on the chi-square value at df=1 and the CFI change (intentionally
##D # use a cutoff from Cheung and Rensvold (2002) in an appropriate situation).
##D getPowerFitNested(Output.ALT.NULL, Output.ALT.ALT, cutoff=c(Chi=3.84, CFI=-0.10))
##D 
##D # The example of continous varying sample size. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output.NULL.NULL2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.NULL, generate=CFA.Model.NULL) 
##D Output.ALT.NULL2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.NULL, generate=CFA.Model.ALT) 
##D Output.NULL.ALT2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.ALT, generate=CFA.Model.NULL) 
##D Output.ALT.ALT2 <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model.ALT, generate=CFA.Model.ALT) 
##D 
##D # Get the power based on the derived cutoff from the null model at the sample size of 250
##D getPowerFitNested(Output.ALT.NULL2, Output.ALT.ALT2, nullNested=Output.NULL.NULL2, 
##D 	nullParent=Output.NULL.ALT2, nVal = 250)
##D 
##D # Get the power based on the rule of thumb from the null model at the sample size of 250
##D getPowerFitNested(Output.ALT.NULL2, Output.ALT.ALT2, cutoff=c(Chi=3.84, CFI=-0.10), nVal = 250)
## End(Not run)



