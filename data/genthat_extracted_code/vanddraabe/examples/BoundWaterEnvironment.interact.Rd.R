library(vanddraabe)


### Name: BoundWaterEnvironment.interact
### Title: Bound Water Environment (interactions)
### Aliases: BoundWaterEnvironment.interact

### ** Examples

  ## Not run: 
##D   distances <- PDB.1hai.h2o.prot.dists[3, ]
##D   set.oi.idc <- prot.idc
##D   names.atoms <- PDB.1hai.aoi.clean$elety[prot.idc]
##D   names.res.atoms <- paste(PDB.1hai.aoi.clean$resid[prot.idc], names.atoms, sep =" ")
##D   BoundWaterEnvironment.interact(distances,
##D                                  set.oi.idc,
##D                                  names.atoms,
##D                                  names.res.atoms,
##D                                  radius = 3.6)
##D   # $adn
##D   # [1] 9
##D   #
##D   # $ahp.sum
##D   # [1] 2.001
##D   #
##D   # $ahp.mu
##D   # [1] 0.2223
##D   #
##D   # $ahp.sd
##D   # [1] 0.2229
##D   #
##D   # $hbonds
##D   # [1] 4
##D   
## End(Not run)




