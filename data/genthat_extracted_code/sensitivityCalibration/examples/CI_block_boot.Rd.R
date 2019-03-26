library(sensitivityCalibration)


### Name: CI_block_boot
### Title: Construct the 95% confidence interval of the treatment effect
###   given the set of sensitivity parameters.
### Aliases: CI_block_boot

### ** Examples

## No test: 
data(NHANES_blood_lead_small_matched)
attach(NHANES_blood_lead_small_matched)

CI_block_boot(9, c(1,0), c(0.5,0.5), 0, 0, NHANES_blood_lead_small_matched, n_boot = 10)

detach(NHANES_blood_lead_small_matched)
## End(No test)



