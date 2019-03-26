library(Surrogate)


### Name: FixedDiscrDiscrIT
### Title: Investigates surrogacy for binary or ordinal outcomes using the
###   Information Theoretic framework
### Aliases: FixedDiscrDiscrIT
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy Individual-level surrogacy Likelihood Reduction
###   Factor (LRF) Fixed-effect models

### ** Examples


## Not run: 
##D  # Time consuming (>5sec) code part
##D # Example 1
##D # Conduct an analysis based on a simulated dataset with 2000 patients, 100 trials,
##D # and Rindiv=Rtrial=.8
##D 
##D # Simulate the data:
##D Sim.Data.MTS(N.Total=2000, N.Trial=100, R.Trial.Target=.8, R.Indiv.Target=.8,
##D Seed=123, Model="Full")
##D 
##D # create a binary true and ordinal surrogate outcome
##D Data.Observed.MTS$True<-findInterval(Data.Observed.MTS$True, 
##D c(quantile(Data.Observed.MTS$True,0.5)))
##D Data.Observed.MTS$Surr<-findInterval(Data.Observed.MTS$Surr, 
##D c(quantile(Data.Observed.MTS$Surr,0.333),quantile(Data.Observed.MTS$Surr,0.666)))
##D 
##D # Assess surrogacy based on a full fixed-effect model
##D # in the information-theoretic framework for a binary surrogate and ordinal true outcome:
##D SurEval <- FixedDiscrDiscrIT(Dataset=Data.Observed.MTS, Surr=Surr, True=True, Treat=Treat,
##D Trial.ID=Trial.ID, Setting="ordbin")
##D 
##D # Show a summary of the results:
##D summary(SurEval)
##D SurEval$Trial.Spec.Results
##D SurEval$R2h
##D SurEval$R2ht
## End(Not run)



