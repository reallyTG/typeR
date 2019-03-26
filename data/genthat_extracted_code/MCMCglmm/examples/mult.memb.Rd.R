library(MCMCglmm)


### Name: mult.memb
### Title: Design Matrices for Multiple Membership Models
### Aliases: mult.memb
### Keywords: manip

### ** Examples

fac1<-factor(sample(letters[1:3], 5, TRUE), levels=letters[1:3])
fac2<-factor(sample(letters[1:3], 5, TRUE), levels=letters[1:3])
cbind(fac1, fac2)
mult.memb(~fac1+fac2)



