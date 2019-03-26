library(MCMCglmm)


### Name: sir
### Title: Design Matrix for Simultaneous and Recursive Relationships
###   between Responses
### Aliases: sir
### Keywords: manip

### ** Examples

fac1<-factor(sample(letters[1:3], 5, TRUE), levels=letters[1:3])
fac2<-factor(sample(letters[1:3], 5, TRUE), levels=letters[1:3])
cbind(fac1, fac2)
sir(~fac1, ~fac2)




