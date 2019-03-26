library(shotGroups)


### Name: range2sigma
### Title: Estimate Rayleigh sigma based on range statistics
### Aliases: range2sigma

### ** Examples

es  <- getMaxPairDist(DFscar17)$d
fom <- getBoundingBox(DFscar17)$FoM
d   <- getBoundingBox(DFscar17)$diag
range2sigma(c(es, fom, d), stat=c("ES", "FoM", "D"),
            n=nrow(DFscar17), nGroups=1, CIlevel=0.9)

# compare with Rayleigh sigma estimate from using
# (x,y)-coordinates of all shots
getRayParam(DFscar17, level=0.9)



