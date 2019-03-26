library(vanddraabe)


### Name: calcNumHydrogenBonds
### Title: Calculate Number of Hydrogen Bonds
### Aliases: calcNumHydrogenBonds

### ** Examples

  ## Not run: 
##D   distances <- PDB.1hai.h2o.prot.dists[3, ]
##D   nearby.atoms.idc <- Nearby(distances, set.idc = prot.idc, radius = 3.6)
##D   names.atoms <- PDB.1hai.aoi.clean$elety[prot.idc]
##D   calcNumHydrogenBonds(distances, nearby.atoms.idc, names.atoms,
##D     set.oi.idc = prot.idc)
##D   # [1] 4
##D   
## End(Not run)




