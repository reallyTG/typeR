library(EdSurvey)


### Name: glm.sdf
### Title: EdSurvey Generalized Linear Models
### Aliases: glm.sdf logit.sdf probit.sdf glm

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # By default uses jackknife variance method using replicate weights
##D table(sdf$b013801)
##D logit1 <- logit.sdf(I(b013801 %in% c("26-100", ">100")) ~ dsex + b017451, data=sdf)
##D # use summary to get detailed results
##D summary(logit1)
##D logit2 <- logit.sdf(I(composite >= 300) ~ dsex + b013801, data=sdf)
##D summary(logit2)
##D 
##D logit3 <- glm.sdf(I(composite >= 300) ~ dsex + b013801, data=sdf, 
##D                   family=quasibinomial(link="logit"))
##D summary(logit3)
## End(Not run)



