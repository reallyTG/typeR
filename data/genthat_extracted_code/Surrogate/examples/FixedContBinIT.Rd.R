library(Surrogate)


### Name: FixedContBinIT
### Title: Fits (univariate) fixed-effect models to assess surrogacy in the
###   case where the true endpoint is continuous and the surrogate endpoint
###   is binary (based on the Information-Theoretic framework)
### Aliases: FixedContBinIT
### Keywords: plot Information-Theoretic ContBin Multiple-trial setting
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
##D # Make S binary
##D Data.Observed.MTS$Surr_Bin <- Data.Observed.MTS$Surr
##D Data.Observed.MTS$Surr_Bin[Data.Observed.MTS$Surr>=0] <- 1
##D Data.Observed.MTS$Surr_Bin[Data.Observed.MTS$Surr<0] <- 0
##D 
##D # Analyze data
##D Fit <- FixedContBinIT(Dataset = Data.Observed.MTS, Surr = Surr_Bin, 
##D True = True, Treat = Treat, Trial.ID = Trial.ID, Pat.ID = Pat.ID, 
##D Model = "Full", Number.Bootstraps=50)
##D 
##D # Examine results
##D summary(Fit)
##D plot(Fit, Trial.Level = FALSE, Indiv.Level.By.Trial=TRUE)
##D plot(Fit, Trial.Level = TRUE, Indiv.Level.By.Trial=FALSE)
## End(Not run)



