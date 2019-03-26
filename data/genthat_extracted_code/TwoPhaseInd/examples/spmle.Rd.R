library(TwoPhaseInd)


### Name: spmle
### Title: function to compute the semiparametric maximum likelihood
###   estimator
### Aliases: spmle
### Keywords: two-phase sampling semiparametric maximum likelihood estimate

### ** Examples

## Load the example data
data(whiBioMarker)
## Here is an example of SPMLE with exploiting independent and with confounding factors:
spmleIndExtra <- spmle(data=whiBioMarker,  ## dataset
                       response="stroke",  ## response variable
                       treatment="hrtdisp",  ## treatment variable
                       BaselineMarker="papbl",	## environment variable
                       extra=c(
                         "age" 	## age
                         , "dias"	## diabetes
                         , "hyp" ## hypertension
                         , "syst" ## systolic
                         , "diabtrt"	## diastolic BP
                         , "lmsepi" ## waist:hip ratio
                       ),	## extra variable(s)
                       phase="phase", ## phase indicator
                       ind=TRUE ## independent or non-independent
)




