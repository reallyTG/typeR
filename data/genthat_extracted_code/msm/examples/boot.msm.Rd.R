library(msm)


### Name: boot.msm
### Title: Bootstrap resampling for multi-state models
### Aliases: boot.msm
### Keywords: models

### ** Examples

## Not run: 
##D   ## Psoriatic arthritis example
##D   data(psor)
##D   psor.q <- rbind(c(0,0.1,0,0),c(0,0,0.1,0),c(0,0,0,0.1),c(0,0,0,0))
##D   psor.msm <- msm(state ~ months, subject=ptnum, data=psor, qmatrix =
##D     psor.q, covariates = ~ollwsdrt+hieffusn,
##D     constraint = list(hieffusn=c(1,1,1),ollwsdrt=c(1,1,2)),
##D     control = list(REPORT=1,trace=2), method="BFGS")
##D   ## Bootstrap the baseline transition intensity matrix.  This will take a long time.
##D   q.list <- boot.msm(psor.msm, function(x)x$Qmatrices$baseline)
##D   ## Manipulate the resulting list of matrices to calculate bootstrap standard errors.
##D   apply(array(unlist(q.list), dim=c(4,4,5)), c(1,2), sd)
##D   ## Similarly calculate a bootstrap 95% confidence interval
##D   apply(array(unlist(q.list), dim=c(4,4,5)), c(1,2),
##D         function(x)quantile(x, c(0.025, 0.975)))
##D   ## Bootstrap standard errors are larger than the asymptotic standard
##D   ## errors calculated from the Hessian
##D   psor.msm$QmatricesSE$baseline
## End(Not run)



