library(poppr)


### Name: is.snpclone
### Title: Check for validity of a genclone or snpclone object
### Aliases: is.snpclone is.clone is.genclone

### ** Examples

(sc <- as.snpclone(glSim(100, 1e3, ploid=2, parallel = FALSE), 
                   parallel = FALSE, n.cores = 1L))
is.snpclone(sc)
is.clone(sc)
data(nancycats)
nanclone <- as.genclone(nancycats)
is.genclone(nanclone)



