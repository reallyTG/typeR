library(MIICD)


### Name: MIICD.coxph
### Title: Cox regression for interval censored data using multiple
###   imputation
### Aliases: MIICD.coxph

### ** Examples

res <- MIICD.coxph(formula = ~ treatment, k = 5, m = 5, data = bcos, verbose = FALSE)
 plot(res)
 #diagnostic plot for coefficients end associated standard error
 plot(res , type = 'coef' , coef = 1)
 plot(res , type = 'sigma' , coef = 1)



