library(smcfcs)


### Name: smcfcs.nestedcc
### Title: Substantive model compatible fully conditional specification
###   imputation of covariates for nested case control studies
### Aliases: smcfcs.nestedcc

### ** Examples

#the following example is not run when the package is compiled on CRAN
#(to keep computation time down), but it can be run by package users
## Not run: 
##D   predictorMatrix <- matrix(0,nrow=dim(ex_ncc)[2],ncol=dim(ex_ncc)[2])
##D   predictorMatrix[which(colnames(ex_ncc)=="x"),c(which(colnames(ex_ncc)=="z"))] <- 1
##D 
##D   imps <- smcfcs.nestedcc(originaldata=ex_ncc,set="setno",nrisk="numrisk",event="d",
##D                           smformula="Surv(t,case)~x+z+strata(setno)",
##D                           method=c("", "", "logreg", "", "", "", "", ""),
##D                           predictorMatrix=predictorMatrix)
##D   library(mitools)
##D   impobj <- imputationList(imps$impDatasets)
##D   models <- with(impobj, clogit(case~x+z+strata(setno)))
##D   summary(MIcombine(models))
## End(Not run)



