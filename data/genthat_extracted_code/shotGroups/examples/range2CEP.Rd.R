library(shotGroups)


### Name: range2CEP
### Title: Estimate circular error probable (CEP) based on range statistics
### Aliases: range2CEP

### ** Examples

es  <- getMaxPairDist(DFscar17)$d
fom <- getBoundingBox(DFscar17)$FoM
d   <- getBoundingBox(DFscar17)$diag
range2CEP(c(es, fom, d), stat=c("ES", "FoM", "D"),
          n=nrow(DFscar17), nGroups=1, CEPlevel=0.5, CIlevel=0.9)

# compare with Rayleigh CEP estimate from using
# (x,y)-coordinates of all shots
getCEP(DFscar17, CEPlevel=0.5, type="Rayleigh")



