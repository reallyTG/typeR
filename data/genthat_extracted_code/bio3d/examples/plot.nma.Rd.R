library(bio3d)


### Name: plot.nma
### Title: Plot NMA Results
### Aliases: plot.nma
### Keywords: hplot

### ** Examples

## Fetch structure
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate modes
modes <- nma(pdb)

plot(modes, sse=pdb)




