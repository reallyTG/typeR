library(Surrogate)


### Name: MixedContContIT
### Title: Fits (univariate) mixed-effect models to assess surrogacy in the
###   continuous-continuous case based on the Information-Theoretic
###   framework
### Aliases: MixedContContIT
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy Individual-level surrogacy Likelihood Reduction
###   Factor (LRF) Mixed-effect models Continuous endpoint

### ** Examples

# Example 1
# Based on the ARMD data:
data(ARMD)
# Assess surrogacy based on a full mixed-effect model
# in the information-theoretic framework:
Sur <- MixedContContIT(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center,
Pat.ID=Id, Model="Full")
# Obtain a summary of the results:
summary(Sur)

## Not run: 
##D  # Time consuming (>5sec) code part
##D # Example 2
##D # Conduct an analysis based on a simulated dataset with 2000 patients, 200 trials,
##D # and Rindiv=Rtrial=.8
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=200, R.Trial.Target=.8, R.Indiv.Target=.8,
##D Seed=123, Model="Full")
##D # Assess surrogacy based on a full mixed-effect model
##D # in the information-theoretic framework:
##D Sur2 <- MixedContContIT(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat,
##D Trial.ID=Trial.ID, Pat.ID=Pat.ID, Model="Full")
##D 
##D # Show a summary of the results:
##D summary(Sur2)
## End(Not run)



