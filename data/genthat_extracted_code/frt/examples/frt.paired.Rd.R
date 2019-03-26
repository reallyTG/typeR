library(frt)


### Name: frt.paired
### Title: Full randomization paired test
### Aliases: frt.paired
### Keywords: htest design

### ** Examples

# Boys' shoes example in Box et al. (2005, 81--84)
data(shoes)
attach(shoes)
frt.paired(matA, matB, alt="l")
detach(shoes)



