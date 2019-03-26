library(cycleRtools)


### Name: Pt_model
### Title: Power-time modelling.
### Aliases: Pt_model

### ** Examples

data(Pt_prof)  # Example power-time profile.

P    <- Pt_prof$pwr
tsec <- Pt_prof$time

mdls <- Pt_model(P, tsec)  # Model.
print(mdls)

coef(mdls)
summary(mdls)




