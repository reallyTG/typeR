library(kmi)


### Name: kmi
### Title: Kaplan-Meier Multiple Imputation for Competing Risks
### Aliases: kmi
### Keywords: survival

### ** Examples

data(icu.pneu)

if (require(survival)) {
    
    dat <- kmi(Surv(start, stop, status) ~ 1, data = icu.pneu,
               etype = event, id= id, failcode = 2, nimp = 5)
    
    ## another way to specify the formula if there is no status
    ## variable
    icu.pneu$ev <- icu.pneu$event
    icu.pneu$ev[icu.pneu$status == 0] <- 0
    
    dat <- kmi(Surv(start, stop, ev != 0) ~ 1, data = icu.pneu,
               etype = ev, id= id, failcode = 2, nimp = 5)
    
    ## with covariates to model the censoring distribution
    dat.cova <- kmi(Surv(start, stop, status) ~ age + sex,
                    data = icu.pneu, etype = event, id = id,
                    failcode = 2, nimp = 5)
    
}



