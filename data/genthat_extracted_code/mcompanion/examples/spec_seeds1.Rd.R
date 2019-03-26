library(mcompanion)


### Name: spec_seeds1
### Title: Generate seed parameters for unit mc-eigenvectors
### Aliases: spec_seeds1
### Keywords: mcspec

### ** Examples

spec_seeds1(c(1), mo = 4)       # NA's
spec_seeds1(c(1,1), mo = 4)     # NA's
spec_seeds1(c(1,1,1), mo = 4)   # NA's (but for parameterisation
                            #     a different approach is used)
spec_seeds1(c(1,1,1,1), mo = 4) # identity matrix but other bases are good too
spec_seeds1(c(2,2,2,2), mo = 4) # no NA's, tops of gen.evecs can be chosen 0
spec_seeds1(c(2,1,1,1), mo = 4) # (can be improved)
spec_seeds1(c(2,1), mo = 4)     # NA's



