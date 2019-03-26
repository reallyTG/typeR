library(smoothSurv)


### Name: a2c
### Title: Work Function for 'smoothSurvReg'
### Aliases: a2c
### Keywords: internal utilities

### ** Examples

ccoef <- c(0.1, 0.2, 0.15, 0.3, 0.25)

### Compute 'a' counterparts
acoef <- c2a(ccoef, 1)
print(acoef)

### And back 'c', ccoef2 should be same as ccoef
ccoef2 <- a2c(acoef)
print(ccoef2)



