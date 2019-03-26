library(simFrame)


### Name: simApply
### Title: Apply a function to subsets
### Aliases: simApply simApply-methods
###   simApply,data.frame,BasicVector,function-method
###   simApply,data.frame,Strata,function-method simSapply
###   simSapply-methods simSapply,data.frame,BasicVector,function-method
###   simSapply,data.frame,Strata,function-method simapply Simapply
###   SimApply simapply-methods Simapply-methods SimApply-methods simsapply
###   Simsapply SimSapply simsapply-methods Simsapply-methods
###   SimSapply-methods
### Keywords: iteration methods

### ** Examples

data(eusilcP)
eusilcP <- eusilcP[, c("region", "gender", "eqIncome")]

## returns data.frame
simApply(eusilcP, c("region", "gender"), 
    function(x) median(x$eqIncome))

## returns vector
simSapply(eusilcP, c("region", "gender"), 
    function(x) median(x$eqIncome))



