library(Surrogate)


### Name: SurvSurv
### Title: Assess surrogacy for two survival endpoints based on information
###   theory and a two-stage approach
### Aliases: SurvSurv
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy Individual-level surrogacy Cox proportional
###   hazards model Survival endpoints Time-to-event endpoints

### ** Examples

# Open Ovarian dataset
data(Ovarian)

# Conduct analysis
Fit <- SurvSurv(Dataset = Ovarian, Surr = Pfs, SurrCens = PfsInd,
True = Surv, TrueCens = SurvInd, Treat = Treat, 
Trial.ID = Center)

# Examine results 
plot(Fit)
summary(Fit)



