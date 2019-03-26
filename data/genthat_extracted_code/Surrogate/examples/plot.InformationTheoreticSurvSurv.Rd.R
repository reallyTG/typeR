library(Surrogate)


### Name: plot.SurvSurv
### Title: Provides plots of trial- and individual-level surrogacy in the
###   Information-Theoretic framework when both S and T are time-to-event
###   endpoints
### Aliases: plot.SurvSurv
### Keywords: Plot surrogacy Information-Theoretic framework Trial-level
###   surrogacy Individual-level surrogacy Multiple-trial setting Survival
###   endpoint

### ** Examples

# Open Ovarian dataset
data(Ovarian)

# Conduct analysis
Fit <- SurvSurv(Dataset = Ovarian, Surr = Pfs, SurrCens = PfsInd,
True = Surv, TrueCens = SurvInd, Treat = Treat, 
Trial.ID = Center, Alpha=.05)

# Examine results 
summary(Fit)
plot(Fit, Trial.Level = FALSE, Indiv.Level.By.Trial=TRUE)
plot(Fit, Trial.Level = TRUE, Indiv.Level.By.Trial=FALSE)



