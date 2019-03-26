library(sensitivityCalibration)


### Name: EM_Algorithm
### Title: Estimate the treatment effect for a matched dataset given the
###   set of sensitivity parameters.
### Aliases: EM_Algorithm

### ** Examples


data(NHANES_blood_lead_small_matched)
attach(NHANES_blood_lead_small_matched)

# Run the EM algorithm assuming no unmeasured confounding, i.e., lambda =delta = 0
EM_Algorithm(9, c(1,0), c(0.5,0.5), 0, 0, NHANES_blood_lead_small_matched)

# Run the EM algorithm assuming the magnitude of the unmeasured confounding is lambda =delta = 1
EM_Algorithm(9, c(1,0), c(0.5,0.5), 1, 1, NHANES_blood_lead_small_matched)

detach(NHANES_blood_lead_small_matched)



