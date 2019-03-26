library(vpc)


### Name: pk_iv_1cmt
### Title: Simulate PK data from a 1-compartment iv model
### Aliases: pk_iv_1cmt

### ** Examples

dat1 <- vpc:::pk_iv_1cmt(t = c(0:72), tau = 24, dose = 120, 
                   CL = 5, Vc = 50)
dat2 <- vpc:::pk_iv_1cmt(t = c(0:72), tau = 24, dose = 120, 
                   CL = 5, Vc = 50, 
                   ruv = list(proportional = 0.1, additive = 0.1))



