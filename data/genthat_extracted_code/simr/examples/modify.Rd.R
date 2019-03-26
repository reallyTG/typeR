library(simr)


### Name: modify
### Title: Modifying model parameters.
### Aliases: modify fixef<- coef<- VarCorr<- sigma<- scale<-

### ** Examples

fm <- lmer(y ~ x + (1|g), data=simdata)
fixef(fm)
fixef(fm)["x"] <- -0.1
fixef(fm)




