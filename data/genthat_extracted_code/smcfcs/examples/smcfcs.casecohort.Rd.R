library(smcfcs)


### Name: smcfcs.casecohort
### Title: Substantive model compatible fully conditional specification
###   imputation of covariates for case cohort studies
### Aliases: smcfcs.casecohort

### ** Examples

#the following example is not run when the package is compiled on CRAN
#(to keep computation time down), but it can be run by package users
## Not run: 
##D   #as per the documentation for ex_cc, the sampling fraction is 10%
##D   imps <- smcfcs.casecohort(ex_cc, smformula="Surv(entertime, t, d)~x+z", sampfrac=0.1,
##D                             in.subco="in.subco", method=c("", "", "norm", "", "", "", ""))
##D   library(mitools)
##D   impobj <- imputationList(imps$impDatasets)
##D   models <- with(impobj, coxph(Surv(entertime,t,d)~x+z+cluster(id)))
##D   summary(MIcombine(models))
## End(Not run)



