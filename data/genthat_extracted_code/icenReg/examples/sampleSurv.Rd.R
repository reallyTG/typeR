library(icenReg)


### Name: sampleSurv
### Title: Samples fitted survival function
### Aliases: sampleSurv

### ** Examples

data("IR_diabetes")
fit <- ic_par(cbind(left, right) ~ gender, data = IR_diabetes)

newdata <- data.frame(gender = "male")
time_samps <- sampleSurv(fit, newdata, 
                         p = c(0.5, .9), 
                         samples = 100)
# 100 samples of the median and 90th percentile for males                        

prob_samps <- sampleSurv(fit, newdata, 
                         q = c(10, 20),
                         samples = 100)
# 100 samples of the cumulative probability at t = 10 and 20 for males                        



