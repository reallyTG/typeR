library(Surrogate)


### Name: TwoStageSurvSurv
### Title: Assess trial-level surrogacy for two survival endpoints using a
###   two-stage approach
### Aliases: TwoStageSurvSurv
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy Cox proportional hazards model Survival
###   endpoints Time-to-event endpoints

### ** Examples

# Open Ovarian dataset
data(Ovarian)

# Conduct analysis
Results <- TwoStageSurvSurv(Dataset = Ovarian, Surr = Pfs, SurrCens = PfsInd, 
True = Surv, TrueCens = SurvInd, Treat = Treat, Trial.ID = Center)

# Examine results of analysis
summary(Results)
plot(Results)



