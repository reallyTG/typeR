library(sensitivityCalibration)


### Name: NHANES_blood_lead_small_matched
### Title: NHANES_blood_lead_small data after matching.
### Aliases: NHANES_blood_lead_small_matched
### Keywords: datasets

### ** Examples

## Not run: 
##D # To run this example, optmatch must be installed
##D set.seed(1)
##D library(optmatch)
##D data(NHANES_blood_lead_small)
##D attach(NHANES_blood_lead_small)
##D 
##D # Perform a fullmatch
##D fm = fullmatch(COP ~. , data = NHANES_blood_lead_small[, 1:9], min.controls = 1/4, max.controls = 4)
##D NHANES_blood_lead_small_matched = cbind(NHANES_blood_lead_small, matches = fm)
##D 
##D # Add a U0 row
##D U0 = rep(1, dim(NHANES_blood_lead_small_matched)[1])
##D NHANES_blood_lead_small_matched = cbind(NHANES_blood_lead_small_matched[,1:9], U0,
##D NHANES_blood_lead_small_matched[, 10:11])
## End(Not run)



