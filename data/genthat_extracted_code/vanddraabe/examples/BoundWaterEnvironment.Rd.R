library(vanddraabe)


### Name: BoundWaterEnvironment
### Title: Bound Water Environment
### Aliases: BoundWaterEnvironment

### ** Examples

  ## Not run: 
##D   distances <- PDB.1hai.h2o.prot.dists[3, ]
##D   set.oi.idc <- prot.idc
##D   names.atoms <- PDB.1hai.aoi.clean$elety[prot.idc]
##D   names.res.atoms <- paste(PDB.1hai.aoi.clean$resid[prot.idc], names.atoms, sep =" ")
##D   structure <- PDB.1hai.aoi.clean
##D   BoundWaterEnvironment(distances,
##D                         set.oi.idc,
##D                         names.atoms,
##D                         names.res.atoms,
##D                         structure,
##D                         radius = 3.6)
##D   
## End(Not run)




