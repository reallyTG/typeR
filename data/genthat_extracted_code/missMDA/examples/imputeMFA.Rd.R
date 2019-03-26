library(missMDA)


### Name: imputeMFA
### Title: Impute dataset with variables structured into groups of
###   variables (groups of continuous or categorical variables)
### Aliases: imputeMFA
### Keywords: models multivariate

### ** Examples

## Not run: 
##D data(orange)
##D ## Impute the data and perform a MFA
##D ## with groups of continuous variables only
##D res.impute <- imputeMFA(orange, group=c(5,3), type=rep("s",2),ncp=2) 
##D res.mfa <- MFA(res.impute$completeObs,group=c(5,3),type=rep("s",2)) 
## End(Not run)
## Not run: 
##D data(vnf)
##D ## Impute the indicator matrix and perform a MFA 
##D ## with groups of categorical variables only
##D res.comp <- imputeMFA(vnf,group=c(6,5,3),type=c("n","n","n"),ncp=2)
##D res.mfa <- MFA(vnf,group=c(6,5,3),type=c("n","n","n"),tab.comp=res.comp)
## End(Not run)



