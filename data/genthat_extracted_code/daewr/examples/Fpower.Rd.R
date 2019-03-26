library(daewr)


### Name: Fpower
### Title: F-Distribution Power Calculation
### Aliases: Fpower

### ** Examples

Fpower(0.05,2,15,6.428)

## The function is currently defined as
function(alpha,nu1,nu2,nc) 1-pf(Fcrit(alpha,nu1,nu2),nu1,nu2,nc)



