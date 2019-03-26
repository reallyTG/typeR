library(Surrogate)


### Name: UnifixedContCont
### Title: Fits univariate fixed-effect models to assess surrogacy in the
###   meta-analytic multiple-trial setting (continuous-continuous case)
### Aliases: UnifixedContCont
### Keywords: Multiple-trial setting Meta-analytic framework Trial-level
###   surrogacy Individual-level surrogacy Fixed-effect models

### ** Examples

## Not run: 
##D  #Time consuming (>5 sec) code parts
##D # Example 1, based on the ARMD data
##D data(ARMD)
##D 
##D # Fit a full univariate fixed-effects model with weighting according to the  
##D # number of patients in stage 2 of the two stage approach to assess surrogacy:
##D Sur <- UnifixedContCont(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center, 
##D Pat.ID=Id, Model="Full", Weighted=TRUE)
##D 
##D # Obtain a summary and plot of the results
##D summary(Sur)
##D plot(Sur)
##D 
##D # Example 2
##D # Conduct an analysis based on a simulated dataset with 2000 patients, 100 trials, 
##D # and Rindiv=Rtrial=.8
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D Seed=123, Model="Reduced")
##D 
##D # Fit a reduced univariate fixed-effects model without weighting to assess
##D # surrogacy:
##D Sur2 <- UnifixedContCont(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat, 
##D Trial.ID=Trial.ID, Pat.ID=Pat.ID, Model="Reduced", Weighted=FALSE)
##D 
##D # Show a summary and plots of results:
##D summary(Sur2)
##D plot(Sur2, Weighted=FALSE)
## End(Not run)



