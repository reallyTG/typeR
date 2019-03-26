library(vpc)


### Name: pk_oral_1cmt
### Title: Simulate PK data from a 1-compartment oral model
### Aliases: pk_oral_1cmt

### ** Examples

dat1 <- vpc:::pk_oral_1cmt(t = c(0:72), tau = 24, dose = 120, 
                     ka = 1, ke = 1, cl = 10)
dat2 <- vpc:::pk_oral_1cmt(t = c(0:72), tau = 24, dose = 120, 
                     ka = 1, ke = 1, cl = 10, 
                     ruv = list(proportional = 0.1, additive = 0.1))



