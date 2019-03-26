library(sensitivityCalibration)


### Name: find_border
### Title: Find the lambda-delta boundary for a fixed sensitivity parameter
###   p.
### Aliases: find_border

### ** Examples

## No test: 
data(NHANES_blood_lead_small_matched)
attach(NHANES_blood_lead_small_matched)

find_border(9, c(1,0), c(0.5,0.5), c(0.5,1,1.5), 0, 4,
NHANES_blood_lead_small_matched, n_boot = 1000)

detach(NHANES_blood_lead_small_matched)
## End(No test)



