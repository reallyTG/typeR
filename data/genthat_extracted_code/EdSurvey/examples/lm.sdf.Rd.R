library(EdSurvey)


### Name: lm.sdf
### Title: EdSurvey Linear Models
### Aliases: lm.sdf lm

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # By default uses jackknife variance method using replicate weights
##D lm1 <- lm.sdf(composite ~ dsex + b017451, data=sdf)
##D lm1
##D 
##D # for more detailed results use summary
##D summary(lm1)
##D 
##D # to specify a variance method, use varMethod
##D lm2 <- lm.sdf(composite ~ dsex + b017451, data=sdf, varMethod="Taylor")
##D lm2
##D summary(lm2)
##D 
##D # Use relevel to set a new omitted category
##D lm3 <- lm.sdf(composite ~ dsex + b017451, data=sdf, relevels=list(dsex="Female"))
##D summary(lm3)
##D 
##D # Use recode to change values for specified variables
##D lm4 <- lm.sdf(composite ~ dsex + b017451, data=sdf,
##D               recode=list(b017451=list(from=c("Never or hardly ever",
##D                                               "Once every few weeks",
##D                                               "About once a week"),
##D                                        to=c("Infrequently")),
##D                           b017451=list(from=c("2 or 3 times a week","Every day"),
##D                                        to=c("Frequently"))))
##D # Note: "Infrequently" is the dropped level for the recoded b017451
##D summary(lm4)
## End(Not run)



