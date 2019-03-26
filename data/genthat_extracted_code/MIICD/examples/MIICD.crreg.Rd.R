library(MIICD)


### Name: MIICD.crreg
### Title: Fine & Gray regression for interval censored competing risks
###   data using multiple imputation
### Aliases: MIICD.crreg

### ** Examples

res <- MIICD.crreg(formula = ~ treatment, k = 5, m = 5, status = 'status',
 trans = 1, data = ICCRD,  cens.code = 0, method = 'ANDA', verbose = FALSE )
 res
 plot(res)
 #diagnostic plot for coefficients end associated standard error
 plot(res , type = 'coef' , coef = 1)
 plot(res , type = 'sigma' , coef = 1)



