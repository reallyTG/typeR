library(SubgrpID)


### Name: filter
### Title: Filter function for predictive/prognostic biomarker candidates
###   for signature development
### Aliases: filter

### ** Examples

## Not run: 
##D data(Sepsis.train)
##D 
##D yvar="survival"
##D xvars=names(Sepsis.train)[2:12]
##D trtvar="THERAPY"
##D trtref="active"
##D set.seed(123)
##D 
##D filter.res <- filter(data=Sepsis.train,
##D type="b",
##D yvar=yvar,
##D xvars=xvars,
##D trtvar=trtvar,
##D trtref=trtref,
##D pre.filter=20,
##D filter.method="univariate")
##D 
##D filter.res
##D 
##D set.seed(123)
##D filter.res <- filter(data=Sepsis.train,
##D type="b",
##D yvar=yvar,
##D xvars=xvars,
##D trtvar=trtvar,
##D trtref=trtref,
##D pre.filter="opt", 
##D filter.method="glmnet")
##D 
##D filter.res
## End(Not run)





