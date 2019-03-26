library(npmlreg)


### Name: missouri
### Title: Missouri lung cancer data
### Aliases: missouri
### Keywords: datasets

### ** Examples

data(missouri)
alldist(Deaths~1, offset=log(Size), random=~1, k=2,
   family=poisson(link='log'), data=missouri)



