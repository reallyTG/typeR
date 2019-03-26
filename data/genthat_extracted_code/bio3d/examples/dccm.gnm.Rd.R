library(bio3d)


### Name: dccm.gnm
### Title: Dynamic Cross-Correlation from Gaussian Network Model
### Aliases: dccm.egnm dccm.gnm
### Keywords: analysis

### ** Examples

## Fetch stucture
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
   
## Calculate normal modes
modes <- gnm(pdb)
   
## Calculate correlation matrix
cm <- dccm(modes)

## Plot correlation map
plot(cm, sse = pdb, contour = FALSE, col.regions = bwr.colors(20),
     at = seq(-1, 1, 0.1))




