library(dlm)


### Name: dlmModTrig
### Title: Create Fourier representation of a periodic DLM component
### Aliases: dlmModTrig
### Keywords: misc

### ** Examples

dlmModTrig(s = 3)
dlmModTrig(tau = 3, q = 1) # same thing
dlmModTrig(s = 4) # for quarterly data
dlmModTrig(s = 4, q = 1)
dlmModTrig(tau = 4, q = 2) # a bad idea!
m1 <- dlmModTrig(tau = 6.3, q = 2); m1
m2 <- dlmModTrig(om = 2 * pi / 6.3, q = 2)
all.equal(unlist(m1), unlist(m2))



