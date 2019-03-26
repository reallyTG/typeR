library(eha)


### Name: coxreg
### Title: Cox regression
### Aliases: coxreg
### Keywords: regression survival

### ** Examples


 dat <- data.frame(time=  c(4, 3,1,1,2,2,3),
                status=c(1,1,1,0,1,1,0),
                x=     c(0, 2,1,1,1,0,0),
                sex=   c(0, 0,0,0,1,1,1))
 coxreg( Surv(time, status) ~ x + strata(sex), data = dat) #stratified model
 # Same as:
 rs <- risksets(Surv(dat$time, dat$status), strata = dat$sex)
 coxreg( Surv(time, status) ~ x, data = dat, rs = rs) #stratified model
 



