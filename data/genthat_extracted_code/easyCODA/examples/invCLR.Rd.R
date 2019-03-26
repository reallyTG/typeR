library(easyCODA)


### Name: invCLR
### Title: Inverse of centred logratios
### Aliases: invCLR
### Keywords: logratio

### ** Examples

data(veg)
# compute centred logratios
veg.CLR <- CLR(veg)$LR
# invert back to original parts (parts closed to sum to 1)
invALR(veg.CLR)



