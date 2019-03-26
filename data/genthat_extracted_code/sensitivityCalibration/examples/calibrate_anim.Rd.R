library(sensitivityCalibration)


### Name: calibrate_anim
### Title: Make the dynamic calibration plot.
### Aliases: calibrate_anim

### ** Examples

## No test: 
data(NHANES_blood_lead_small_matched)
attach(NHANES_blood_lead_small_matched)

# Prepare the border
lambda_vec = c(seq(0.1,1.9,0.1), 2.2, 2.5, 3, 3.5, 4)
delta_vec = c(7.31, 5.34, 4.38, 3.76, 3.18, 2.87, 2.55, 2.36, 2.16, 1.99, 1.86,
1.74, 1.63, 1.54, 1.44, 1.40, 1.31, 1.28, 1.22, 1.08, 0.964, 0.877, 0.815, 0.750)
border = data.frame(lambda_vec, delta_vec)

calibrate_anim(border, 9, c(1,0), c(0.5,0.5), 10, 5, 3.5, NHANES_blood_lead_small_matched)

detach(NHANES_blood_lead_small_matched)
## End(No test)



