library(Surrogate)


### Name: plot TwoStageSurvSurv
### Title: Plots trial-level surrogacy in the meta-analytic framework when
###   two survival endpoints are considered.
### Aliases: plot.TwoStageSurvSurv
### Keywords: Plot surrogacy Information-theoretic framework Trial-level
###   surrogacy Multiple-trial setting Single-trial setting Survival
###   endpoints

### ** Examples

# Open Ovarian dataset
data(Ovarian)
# Conduct analysis
Results <- TwoStageSurvSurv(Dataset = Ovarian, Surr = Pfs, SurrCens = PfsInd,
True = Surv, TrueCens = SurvInd, Treat = Treat, Trial.ID = Center)
# Examine results of analysis
summary(Results)
plot(Results)



