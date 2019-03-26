library(Surrogate)


### Name: BifixedContCont
### Title: Fits a bivariate fixed-effects model to assess surrogacy in the
###   meta-analytic multiple-trial setting (Continuous-continuous case)
### Aliases: BifixedContCont
### Keywords: Multiple-trial setting Meta-analytic framework Trial-level
###   surrogacy Individual-level surrogacy Fixed-effect models

### ** Examples

## Not run: 
##D  # time consuming code part
##D # Example 1, based on the ARMD data
##D data(ARMD)
##D 
##D # Fit a full bivariate fixed-effects model with weighting according to the  
##D # number of patients in stage 2 of the two stage approach to assess surrogacy:
##D Sur <- BifixedContCont(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center, 
##D Pat.ID=Id, Model="Full", Weighted=TRUE)
##D 
##D # Obtain a summary of the results
##D summary(Sur)
##D 
##D # Obtain a graphical representation of the trial- and individual-level surrogacy
##D plot(Sur)
##D 
##D 
##D # Example 2
##D # Conduct a surrogacy analysis based on a simulated dataset with 2000 patients, 
##D # 100 trials, and Rindiv=Rtrial=.8
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D Seed=123, Model="Reduced")
##D 
##D # Fit a reduced bivariate fixed-effects model with no weighting according to the 
##D # number of patients in stage 2 of the two stage approach to assess surrogacy:
##D \dontrun{ #time-consuming code parts
##D Sur2 <- BifixedContCont(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat, 
##D Trial.ID=Trial.ID, Pat.ID=Pat.ID, , Model="Reduced", Weighted=FALSE)
##D 
##D # Show summary and plots of results:
##D summary(Sur2)
##D plot(Sur2, Weighted=FALSE)}
## End(Not run)



