library(scan)


### Name: pand
### Title: Percentage of all non-overlapping data
### Aliases: pand

### ** Examples

## Calculate the PAND for a MMBD over three cases
gunnar <- makeSCDF(c(2,3,1,5,3,4,2,6,4,7), B.start = 5)
birgit <- makeSCDF(c(3,3,2,4,7,4,2,1,4,7), B.start = 4)
bodo <- makeSCDF(c(2,3,4,5,3,4,7,6,8,7), B.start = 6)
mbd <- list(gunnar, birgit, bodo)
pand(mbd)
pand(bodo)

## Calculate the PAND with an expected decrease of phase B scores
cubs <- makeSCDF(c(20,22,24,17,21,13,10,9,20,9,18), B.start = 5)
pand(cubs, decreasing = TRUE)



