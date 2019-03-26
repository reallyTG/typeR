library(Surrogate)


### Name: plot Information-Theoretic BinCombn
### Title: Provides plots of trial- and individual-level surrogacy in the
###   Information-Theoretic framework when both S and T are binary, or when
###   S is binary and T is continuous (or vice versa)
### Aliases: 'plot Information-Theoretic BinCombn' plot.FixedBinBinIT
###   plot.FixedBinContIT plot.FixedContBinIT
### Keywords: Plot surrogacy Information-Theoretic framework Trial-level
###   surrogacy Individual-level surrogacy Multiple-trial setting
###   Fixed-effect models Binary endpoint

### ** Examples

## Not run: 
##D  # Time consuming (>5sec) code part
##D # Generate data with continuous Surr and True
##D Sim.Data.MTS(N.Total=5000, N.Trial=50, R.Trial.Target=.9, R.Indiv.Target=.9,
##D              Fixed.Effects=c(0, 0, 0, 0), D.aa=10, D.bb=10, Seed=1,
##D              Model=c("Full"))
##D # Dichtomize Surr and True
##D Surr_Bin <- Data.Observed.MTS$Surr
##D Surr_Bin[Data.Observed.MTS$Surr>.5] <- 1
##D Surr_Bin[Data.Observed.MTS$Surr<=.5] <- 0
##D True_Bin <- Data.Observed.MTS$True
##D True_Bin[Data.Observed.MTS$True>.15] <- 1
##D True_Bin[Data.Observed.MTS$True<=.15] <- 0
##D Data.Observed.MTS$Surr <- Surr_Bin
##D Data.Observed.MTS$True <- True_Bin
##D 
##D # Assess surrogacy using info-theoretic framework
##D Fit <- FixedBinBinIT(Dataset = Data.Observed.MTS, Surr = Surr, 
##D True = True, Treat = Treat, Trial.ID = Trial.ID, 
##D Pat.ID = Pat.ID, Number.Bootstraps=100)
##D 
##D # Examine results
##D summary(Fit)
##D plot(Fit, Trial.Level = FALSE, Indiv.Level.By.Trial=TRUE)
##D plot(Fit, Trial.Level = TRUE, Indiv.Level.By.Trial=FALSE)
## End(Not run)



