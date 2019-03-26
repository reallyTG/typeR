library(icenReg)


### Name: IR_diabetes
### Title: Interval censored time from diabetes onset to diabetic
###   nephronpathy
### Aliases: IR_diabetes

### ** Examples

 data(IR_diabetes)
 fit <- ic_par(cbind(left, right) ~ gender, 
               data = IR_diabetes,
               model = "po",
               dist = "loglogistic")



