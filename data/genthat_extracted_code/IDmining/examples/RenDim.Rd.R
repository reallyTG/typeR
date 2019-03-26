library(IDmining)


### Name: RenDim
### Title: Renyi's Generalized Dimensions
### Aliases: RenDim

### ** Examples

sim_dat <- SwissRoll(1000)

scaleQ <- 1:15 # It starts with a grid of 1^E cell (or quadrat).
               # It ends with a grid of 15^E cells (or quadrats).
qRI_ID <- RenDim(sim_dat[,c(1,2)], scaleQ[5:15])

print(paste("The ID estimate is equal to",round(qRI_ID[[1]][1,2],2)))



