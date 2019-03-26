library(lme4)


### Name: VarCorr
### Title: Extract Variance and Correlation Components
### Aliases: VarCorr VarCorr.merMod as.data.frame.VarCorr.merMod
###   print.VarCorr.merMod
### Keywords: models

### ** Examples

data(Orthodont, package="nlme")
fm1 <- lmer(distance ~ age + (age|Subject), data = Orthodont)
(vc <- VarCorr(fm1))  ## default print method: standard dev and corr
## both variance and std.dev.
print(vc,comp=c("Variance","Std.Dev."),digits=2)
## variance only
print(vc,comp=c("Variance"))
as.data.frame(vc)
as.data.frame(vc,order="lower.tri")



