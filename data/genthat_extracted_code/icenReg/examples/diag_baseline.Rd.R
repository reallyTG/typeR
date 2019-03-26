library(icenReg)


### Name: diag_baseline
### Title: Compare parametric baseline distributions with semi-parametric
###   baseline
### Aliases: diag_baseline

### ** Examples

data(IR_diabetes)
fit <- ic_par(cbind(left, right) ~ gender, 
             data = IR_diabetes)

diag_baseline(fit, lgdLocation = "topright", 
             dist = c("exponential", "weibull", "loglogistic"))




