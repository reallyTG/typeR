library(MIICD)


### Name: MI.ci
### Title: Cumulative incidence estimation for interval censored competing
###   risks data using multiple imputation
### Aliases: MI.ci

### ** Examples

res <- MI.ci(k = 5,  m = 5, status = 'status',  trans = 1 , data = ICCRD,
 conf.int = TRUE, cens.code = 0 , alpha = 0.05)
 res
 print(res)
 plot(res)



