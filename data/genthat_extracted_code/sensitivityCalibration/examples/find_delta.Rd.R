library(sensitivityCalibration)


### Name: find_delta
### Title: Estimate the maximum delta for fixed sensitivity parameters p
###   and lambda.
### Aliases: find_delta

### ** Examples

## No test: 
data(NHANES_blood_lead_small_matched)
attach(NHANES_blood_lead_small_matched)

find_delta(9, c(1,0), c(0.5,0.5), 1, 1, 3,
NHANES_blood_lead_small_matched, n_boot = 1000)

detach(NHANES_blood_lead_small_matched)
## End(No test)



