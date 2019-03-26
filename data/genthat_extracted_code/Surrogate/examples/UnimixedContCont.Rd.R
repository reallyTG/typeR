library(Surrogate)


### Name: UnimixedContCont
### Title: Fits univariate mixed-effect models to assess surrogacy in the
###   meta-analytic multiple-trial setting (continuous-continuous case)
### Aliases: UnimixedContCont
### Keywords: Multiple-trial setting Meta-analytic framework Trial-level
###   surrogacy Individual-level surrogacy Mixed-effect models

### ** Examples


## Not run: 
##D  #Time consuming code part
##D # Conduct an analysis based on a simulated dataset with 2000 patients, 100 trials, 
##D # and Rindiv=Rtrial=.8
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D Seed=123, Model="Reduced")
##D 
##D # Fit a reduced univariate mixed-effects model without weighting to assess surrogacy:
##D Sur <- UnimixedContCont(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat, 
##D Trial.ID=Trial.ID, Pat.ID=Pat.ID, Model="Reduced", Weighted=FALSE)
##D 
##D # Show a summary and plots of the results:
##D summary(Sur)
##D plot(Sur, Weighted=FALSE)
## End(Not run)



