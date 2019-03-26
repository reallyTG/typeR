library(IDmining)


### Name: MINDID
### Title: The (Multipoint) Morisita Index for Intrinsic Dimension
###   Estimation
### Aliases: MINDID

### ** Examples

sim_dat <- SwissRoll(1000)

scaleQ <- 1:15 # It starts with a grid of 1^E cell (or quadrat).
               # It ends with a grid of 15^E cells (or quadrats).
mMI_ID <- MINDID(sim_dat, scaleQ[5:15])

print(paste("The ID estimate is equal to",round(mMI_ID[[1]][1,3],2)))



