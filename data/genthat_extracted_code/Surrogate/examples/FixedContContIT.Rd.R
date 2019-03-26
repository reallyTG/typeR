library(Surrogate)


### Name: FixedContContIT
### Title: Fits (univariate) fixed-effect models to assess surrogacy in the
###   continuous-continuous case based on the Information-Theoretic
###   framework
### Aliases: FixedContContIT
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy Individual-level surrogacy Likelihood Reduction
###   Factor (LRF) Fixed-effect models

### ** Examples

# Example 1
# Based on the ARMD data

data(ARMD)
# Assess surrogacy based on a full fixed-effect model
# in the information-theoretic framework:
Sur <- FixedContContIT(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center,
Pat.ID=Id, Model="Full", Number.Bootstraps=50)
# Obtain a summary of the results:
summary(Sur)

## Not run: 
##D  #time consuming code
##D # Example 2
##D # Conduct an analysis based on a simulated dataset with 2000 patients, 100 trials,
##D # and Rindiv=Rtrial=.8
##D 
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D              Seed=123, Model="Full")
##D # Assess surrogacy based on a full fixed-effect model
##D # in the information-theoretic framework:
##D Sur2 <- FixedContContIT(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat,
##D Trial.ID=Trial.ID, Pat.ID=Pat.ID, Model="Full", Number.Bootstraps=50)
##D 
##D # Show a summary of the results:
##D summary(Sur2)
## End(Not run)



