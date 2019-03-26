library(bio3d)


### Name: plot.rmsip
### Title: Plot RMSIP Results
### Aliases: plot.rmsip
### Keywords: hplot

### ** Examples

## Read PDB structure
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Perform NMA
modes.a <- nma(pdb, ff="calpha")
modes.b <- nma(pdb, ff="anm")

## Calculate and plot RMSIP
r <- rmsip(modes.a, modes.b)
plot(r)



