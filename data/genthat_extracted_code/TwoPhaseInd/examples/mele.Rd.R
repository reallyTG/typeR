library(TwoPhaseInd)


### Name: mele
### Title: function to compute the maximum estimated likelihood estimator
### Aliases: mele
### Keywords: two-phase sampling semiparametric maximum likelihood estimate

### ** Examples

## Load the example data
data(whiBioMarker)
## Here is an example of MELE with exploiting independent and with confounding factors:

melIndExtra <- mele(data=whiBioMarker,  ## dataset
          response="stroke",	## response variable
          treatment="hrtdisp",		## treatment variable
          BaselineMarker="papbl",		## environment variable
          extra=c(
             "age" 	## age
                		## physical activity levels
              , "dias" 	## diabetes
              , "hyp" ## hypertension
              , "syst" 	## systolic
              , "diabtrt"	## diastolic BP
              , "lmsepi" ## waist:hip ratio
              ),	## extra variable(s)
          phase="phase",	## phase indicator
          ind=TRUE	## independent or non-indepentent
)



