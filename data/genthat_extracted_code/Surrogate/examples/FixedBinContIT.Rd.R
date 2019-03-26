library(Surrogate)


### Name: FixedBinContIT
### Title: Fits (univariate) fixed-effect models to assess surrogacy in the
###   case where the true endpoint is binary and the surrogate endpoint is
###   continuous (based on the Information-Theoretic framework)
### Aliases: FixedBinContIT
### Keywords: plot Information-Theoretic BinCont Multiple-trial setting
###   Information-theoretic framework Trial-level surrogacy
###   Individual-level surrogacy Likelihood Reduction Factor (LRF)
###   Fixed-effect models Binary endpoint Continuous endpoint

### ** Examples

## Not run: 
##D  # Time consuming (>5sec) code part
##D # Generate data with continuous Surr and True
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, 
##D R.Indiv.Target=.8, Seed=123, Model="Full")
##D 
##D # Make T binary
##D Data.Observed.MTS$True_Bin <- Data.Observed.MTS$True
##D Data.Observed.MTS$True_Bin[Data.Observed.MTS$True>=0] <- 1
##D Data.Observed.MTS$True_Bin[Data.Observed.MTS$True<0] <- 0
##D 
##D # Analyze data
##D Fit <- FixedBinContIT(Dataset = Data.Observed.MTS, Surr = Surr, 
##D True = True_Bin, Treat = Treat, Trial.ID = Trial.ID, Pat.ID = Pat.ID, 
##D Model = "Full", Number.Bootstraps=50)
##D 
##D # Examine results
##D summary(Fit)
##D plot(Fit, Trial.Level = FALSE, Indiv.Level.By.Trial=TRUE)
##D plot(Fit, Trial.Level = TRUE, Indiv.Level.By.Trial=FALSE)
## End(Not run)



