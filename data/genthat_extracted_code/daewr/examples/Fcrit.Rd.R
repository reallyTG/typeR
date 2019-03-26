library(daewr)


### Name: Fcrit
### Title: F-Distribution critical values
### Aliases: Fcrit
### Keywords: datagen

### ** Examples

Fcrit(.05,2,15)
## The function is currently defined as
function(alpha,nu1,nu2) qf(1-alpha,nu1,nu2)



