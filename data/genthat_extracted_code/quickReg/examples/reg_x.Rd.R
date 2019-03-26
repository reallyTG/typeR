library(quickReg)


### Name: reg_x
### Title: Build regression models only one dependent variable
### Aliases: reg_x

### ** Examples

reg_glm<-reg_x(data = diabetes, x = c(1:4, 6), y = 5, factors = c(1, 3, 4), model = 'glm')
##  other methods
fit<-reg_x(data = diabetes, x = c(1, 3:6), y = "age", factors = c(1, 3, 4), model = 'lm')
fit<-reg_x(data = diabetes, x = c( "sex","education","BMI"), y = "diabetes",
time ="age", factors = c("sex","smoking","education"), model = 'coxph')



