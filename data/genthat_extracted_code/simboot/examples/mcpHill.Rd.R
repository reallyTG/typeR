library(simboot)


### Name: mcpHill
### Title: Multiplicity-adjusted p-values for comparing biodiversity via
###   simultaneous inference of a user-defined selection of diversity
###   indices
### Aliases: mcpHill
### Keywords: htest

### ** Examples

### Multiple testing with user-defined contrasts after block alignment

data(predatGM)

mymat <- rbind( "GM - S1" = c(1,-1,0,0), "GM - S2" = c(1,0,-1,0), "GM -
  S3" = c(1,0,0,-1), "S1 - S2" = c(0,1,-1,0), "S1 - S3" = c(0,1,0,-1) )

# example runs with only 100 bootstrap steps. For estimation use 2000 or more.
mcpHill(dataf=predatGM[,3:35], fact=predatGM[,2], align=TRUE,
block=predatGM[,1], boots=100, udmat=TRUE, usermat=mymat, qval=seq(-1,
3, by=0.5))

# with Dunnett-type contrast matrix
mcpHill(dataf=predatGM[,3:35], fact=predatGM[,2], align=TRUE,
block=predatGM[,1], boots=100, udmat=FALSE, mattype = "Dunnett", qval=seq(-1,
3, by=0.5))




