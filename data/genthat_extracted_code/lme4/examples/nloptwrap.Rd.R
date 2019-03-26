library(lme4)


### Name: nloptwrap
### Title: Wrappers for additional optimizers
### Aliases: nloptwrap nlminbwrap

### ** Examples

environment(nloptwrap)$defaultControl
library(lme4)
## BOBYQA (default): note "nloptwrap" is now the default optimizer
## for lmer
fm1 <- lmer(Reaction~Days+(Days|Subject),
            sleepstudy,
            control=lmerControl(optimizer="nloptwrap"))
## tighten tolerances
fm1B <- update(fm1,control=lmerControl(optimizer="nloptwrap",
                            optCtrl=list(xtol_abs=1e-8,ftol_abs=1e-8)))
## run for longer (no effect in this case)
fm1C <- update(fm1,control=lmerControl(optimizer="nloptwrap",
                                optCtrl=list(maxeval=10000)))

logLik(fm1B)-logLik(fm1)  ## small difference in log likelihood
logLik(fm1C)-logLik(fm1)  ## no difference in LL
## Nelder-Mead
fm1_nloptr_NM <- update(fm1,control=lmerControl(optimizer="nloptwrap",
                            optCtrl=list(algorithm="NLOPT_LN_NELDERMEAD")))
## other nlOpt algorithm options include NLOPT_LN_COBYLA, NLOPT_LN_SBPLX
fm1_nlminb <- update(fm1,control=lmerControl(optimizer="nlminbwrap"))
if (require(optimx)) {
    fm1_nlminb2 <- update(fm1,control=lmerControl(optimizer="optimx",
                              optCtrl=list(method="nlminb",kkt=FALSE)))
}



