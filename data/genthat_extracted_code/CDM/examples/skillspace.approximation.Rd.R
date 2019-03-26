library(CDM)


### Name: skillspace.approximation
### Title: Skill Space Approximation
### Aliases: skillspace.approximation
### Keywords: Skill space approximation

### ** Examples

#############################################################################
# EXAMPLE 1: Approximate a skill space of K=8 eight skills by 20 classes
#############################################################################

#=> 2^8=256 latent classes if all latent classes would be used
CDM::skillspace.approximation( L=20, K=8 )
  ##             [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
  ##   P00000000    0    0    0    0    0    0    0    0
  ##   P00000001    0    0    0    0    0    0    0    1
  ##   P00001011    0    0    0    0    1    0    1    1
  ##   P00010011    0    0    0    1    0    0    1    1
  ##   P00101001    0    0    1    0    1    0    0    1
  ##   [...]
  ##   P11011110    1    1    0    1    1    1    1    0
  ##   P11100110    1    1    1    0    0    1    1    0
  ##   P11111111    1    1    1    1    1    1    1    1



