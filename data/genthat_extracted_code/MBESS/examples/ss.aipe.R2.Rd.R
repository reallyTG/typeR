library(MBESS)


### Name: ss.aipe.R2
### Title: Sample Size Planning for Accuracy in Parameter Estimation for
###   the multiple correlation coefficient.
### Aliases: ss.aipe.R2
### Keywords: design

### ** Examples

## Not run: 
##D # Returned sample size should be considered approximate; exact sample
##D # size is obtained by specifying the argument 'verify.ss=TRUE' (see below).
##D # ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D # p=5, Random.Predictors=TRUE)
##D # Uncomment to run in order to get exact sample size.
##D # ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D # p=5, Random.Predictors=TRUE, verify.ss=TRUE)
##D 
##D 
##D # Same as above, except the predictor variables are considered fixed.
##D # Returned sample size should be considered approximate; exact sample
##D # size is obtained by specifying the argument 'verify.ss=TRUE'.
##D # ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D # p=5, Random.Predictors=FALSE)
##D # Uncomment to run in order to get exact sample size.
##D #ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D #p=5, Random.Predictors=FALSE, verify.ss=TRUE)
##D 
##D 
##D # Returned sample size should be considered approximate; exact sample
##D # size is obtained by specifying the argument 'verify.ss=TRUE'.
##D # ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D # p=5, degree.of.certainty=.85, Random.Predictors=TRUE)
##D # Uncomment to run in order to get exact sample size.
##D #ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D #p=5, degree.of.certainty=.85, Random.Predictors=TRUE, verify.ss=TRUE)
##D 
##D 
##D # Same as above, except the predictor variables are considered fixed.
##D # Returned sample size should be considered approximate; exact sample
##D # size is obtained by specifying the argument 'verify.ss=TRUE'.
##D # ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D # p=5, degree.of.certainty=.85, Random.Predictors=FALSE)
##D # Uncomment to run in order to get exact sample size.
##D #ss.aipe.R2(Population.R2=.50, conf.level=.95, width=.10, which.width="Full",
##D #p=5, degree.of.certainty=.85, Random.Predictors=FALSE, verify.ss=TRUE)
## End(Not run)



