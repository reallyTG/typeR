library(bio3d)


### Name: dccm.nma
### Title: Dynamic Cross-Correlation from Normal Modes Analysis
### Aliases: dccm.nma
### Keywords: analysis

### ** Examples


## Fetch stucture
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate normal modes
modes <- nma(pdb)

## Calculate correlation matrix
cm <- dccm.nma(modes)

## Plot correlation map
plot(cm, sse = pdb, contour = FALSE, col.regions = bwr.colors(20),
     at = seq(-1, 1, 0.1))



