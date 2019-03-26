library(frailtypack)


### Name: Cmeasures
### Title: Concordance measures in shared frailty and Cox proportional
###   hazard models
### Aliases: Cmeasures CbootstrapFP cindexes.frailty cindexes.W cindexes.B
###   cindexes statFP
### Keywords: concordance

### ** Examples



## Not run: 
##D 
##D #-- load data
##D data(readmission)
##D 
##D #-- a frailtypenal fit
##D fit <- frailtyPenal(Surv(time,event)~cluster(id)+dukes+
##D charlson+chemo,data=readmission,cross.validation=FALSE,
##D n.knots=10,kappa=1,hazard="Splines")
##D 
##D #-- a Cmeasures call
##D fit.Cmeasures <- Cmeasures(fit)
##D fit.Cmeasures.noties <- Cmeasures(fit, ties=0)
##D fit.Cmeasures.marginal <- Cmeasures(fit, marginal=1)
##D fit.Cmeasures.cindex <- Cmeasures(fit, cindex=1)
##D 
##D #-- a short summary
##D fit.Cmeasures
##D fit.Cmeasures.noties
##D fit.Cmeasures.marginal
##D fit.Cmeasures.cindex
##D 
## End(Not run)





