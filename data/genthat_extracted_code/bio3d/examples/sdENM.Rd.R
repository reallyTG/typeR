library(bio3d)


### Name: sdENM
### Title: Index for the sdENM ff
### Aliases: sdENM
### Keywords: datasets

### ** Examples

## Load force constant data
data(sdENM)

## force constants for amino acids A, C, D, E, and F
## in distance range [4, 4.5)
sdENM[1:5, 1:5, 1]

## and distance range [4.5, 5)
sdENM[1:5, 1:5, 2]

## amino acid pair A-P, at distance 4.2
sdENM["A", "P", 1]

## Not run: 
##D ## for use in NMA
##D pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
##D modes <- nma(pdb, ff="sdenm")
## End(Not run)



