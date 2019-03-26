library(DoE.wrapper)


### Name: ccd.design
### Title: Function for accessing central composite designs from package
###   rsm
### Aliases: ccd.design
### Keywords: array design

### ** Examples

ccd.design(5) ## per default uses the resolution V design in 16 runs for the cube
ccd.design(5, ncube=32) ## uses the full factorial for the cube
ccd.design(5, ncenter=6, default.levels=c(-10,10))
## blocked design (requires ncube to be specified)
ccd.design(5, ncube=32, blocks=4) 
## there is only one star point block

## for usage of other options, look at the FrF2 documentation



