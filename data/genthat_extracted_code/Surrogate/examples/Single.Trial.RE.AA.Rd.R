library(Surrogate)


### Name: Single.Trial.RE.AA
### Title: Conducts a surrogacy analysis based on the single-trial
###   meta-analytic framework
### Aliases: Single.Trial.RE.AA plot.Single.Trial.RE.AA
### Keywords: Single-trial setting Meta-analytic framework Individual-level
###   surrogacy Trial-level surrogacy Relative effect Adjusted Association

### ** Examples

## Not run: 
##D  # time consuming code part
##D # Example 1, based on the ARMD data:
##D data(ARMD)
##D 
##D # Assess surrogacy based on the single-trial meta-analytic approach:
##D Sur <- Single.Trial.RE.AA(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Pat.ID=Id)
##D 
##D # Obtain a summary and plot of the results
##D summary(Sur)
##D plot(Sur)
##D 
##D 
##D # Example 2
##D # Conduct an analysis based on a simulated dataset with 2000 patients 
##D # and Rindiv=.8
##D # Simulate the data:
##D Sim.Data.STS(N.Total=2000, R.Indiv.Target=.8, Seed=123)
##D 
##D # Assess surrogacy:
##D Sur2 <- Single.Trial.RE.AA(Dataset=Data.Observed.STS, Surr=Surr, True=True, Treat=Treat, 
##D Pat.ID=Pat.ID)
##D 
##D # Show a summary and plots of results
##D summary(Sur2)
##D plot(Sur2)
## End(Not run)



