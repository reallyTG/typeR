library(Surrogate)


### Name: plot FixedDiscrDiscrIT
### Title: Provides plots of trial-level surrogacy in the
###   Information-Theoretic framework
### Aliases: 'plot FixedDiscrDiscrIT' plot.FixedDiscrDiscrIT
### Keywords: Plot surrogacy Information-Theoretic framework Trial-level
###   surrogacy Individual-level surrogacy Multiple-trial setting

### ** Examples

## Not run: 
##D  # Time consuming (>5sec) code part
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D              Seed=123, Model="Full")
##D              
##D # create a binary true and ordinal surrogate outcome
##D Data.Observed.MTS$True<-findInterval(Data.Observed.MTS$True, 
##D         c(quantile(Data.Observed.MTS$True,0.5)))
##D Data.Observed.MTS$Surr<-findInterval(Data.Observed.MTS$Surr, 
##D         c(quantile(Data.Observed.MTS$Surr,0.333),quantile(Data.Observed.MTS$Surr,0.666)))
##D 
##D # Assess surrogacy based on a full fixed-effect model
##D # in the information-theoretic framework for a binary surrogate and ordinal true outcome:
##D SurEval <- FixedDiscrDiscrIT(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat,
##D Trial.ID=Trial.ID, Setting="ordbin")
##D 
##D ## Request trial-level surrogacy plot. In the trial-level plot,
##D ## make the size of the circles proportional to the number of patients in a trial:
##D plot(SurEval, Weighted=FALSE)
##D 
## End(Not run)


