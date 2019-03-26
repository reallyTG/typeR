library(kmi)


### Name: cox.kmi
### Title: Cox proportional hazards model applied to imputed data sets
### Aliases: cox.kmi
### Keywords: survival models regression

### ** Examples

data(icu.pneu)


if (require(survival)) {
    
    set.seed(1313)
    imp.dat <- kmi(Surv(start, stop, status) ~ 1, data = icu.pneu,
                   etype = event, id = id, failcode = 2, nimp = 5)
    
    fit.kmi <- cox.kmi(Surv(start, stop, event == 2) ~ pneu, imp.dat)
    
    summary(fit.kmi)
    
### Now using the censoring-complete data
    fit <- coxph(Surv(start, adm.cens.exit, event == 2) ~ pneu, icu.pneu)
    
    summary(fit)
    
    ## estimation of the censoring distribution adjusted on covariates
    dat.cova <- kmi(Surv(start, stop, status) ~ age + sex,
                    data = icu.pneu, etype = event, id = id,
                    failcode = 2, nimp = 5)
    
    fit.kmi2 <- cox.kmi(Surv(start, adm.cens.exit, event == 2) ~ pneu + age,
                        dat.cova)
    
    summary(fit.kmi2)
}



