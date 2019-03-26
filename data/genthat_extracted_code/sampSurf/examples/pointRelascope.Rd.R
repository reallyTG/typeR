library(sampSurf)


### Name: pointRelascope
### Title: Generate Objects of Class "'pointRelascope'"
### Aliases: pointRelascope
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
#  create an object with a with 4:1 reach:width factor angle...
#
(angle = .StemEnv$rad2Deg(2*atan(1/4)))
prs = pointRelascope(angle, units='English')
prs



