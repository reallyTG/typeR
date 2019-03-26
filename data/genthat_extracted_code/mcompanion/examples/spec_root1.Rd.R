library(mcompanion)


### Name: spec_root1
### Title: Give the spectral parameters for eigenvalues of mc-matrices
###   equal to one
### Aliases: spec_root1
### Keywords: mcspec

### ** Examples

spec_root1(4, root1 = 1)
spec_root1(4, root1 = c(1,0,0,0))  # same
spec_root1(4, iorder = 1)          # same

spec_root1(4, root1 = 2)
spec_root1(4, root1 = c(2,0,0,0))  # same
spec_root1(4, iorder = 2)          # same

spec_root1(4, root1 = c(1,1,1,1))
spec_root1(4, siorder = 1)          # same

spec_root1(4, root1 = c(2,2,2,2))
spec_root1(4, siorder = 2)          # same


spec_root1(4, root1 = c(2,1,1,1))
spec_root1(4, iorder = 1, siorder = 1) # same


spec_root1(4, root1 = c(2,1))
spec_root1(4, root1 = c(2,1,1))




