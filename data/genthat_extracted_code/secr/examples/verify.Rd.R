library(secr)


### Name: verify
### Title: Check SECR Data
### Aliases: verify verify.default verify.traps verify.capthist verify.mask
### Keywords: manip

### ** Examples


verify(captdata)

## create null (complete) usage matrix, and mess it up
temptraps <- make.grid()
usage(temptraps) <- matrix(1, nr = nrow(temptraps), nc = 5)
usage(temptraps)[,5] <- 0
verify (temptraps)

## create mask, and mess it up
tempmask <- make.mask(temptraps)
verify(tempmask)
tempmask[1,1] <- NA
verify(tempmask)




