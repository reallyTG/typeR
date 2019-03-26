library(vanddraabe)


### Name: Nearby
### Title: Nearby
### Aliases: Nearby

### ** Examples

  ## Not run: 
##D   ##----- determine atom indices
##D   ProtHetWat.idc <- ProtHetWatIndices(thrombin.1hai$atom)
##D   prot.idc <- ProtHetWat.idc$prot.idc
##D   het.idc <- ProtHetWat.idc$het.idc
##D   h2o.idc <- ProtHetWat.idc$h2o.idc
##D 
##D   ##----- calculate the distances
##D   atoms.dist <- as.matrix(dist(thrombin.1hai$atom[, c("x","y","z")],
##D                                method = "euclidean",
##D                                diag = TRUE, upper = TRUE))
##D   diag(atoms.dist) <- NA
##D   atom.idc <- sort(c(prot.idc, het.idc, h2o.idc))
##D   atoms.dist <- atoms.dist[atom.idc, atom.idc]
##D 
##D   ##----- determine nearby atoms
##D   nearby.prot.idc <- Nearby(distances = atoms.dist[h2o.idc[1], ],
##D                             set.idc = prot.idc,
##D                             radius = 3.6)
##D   nearby.prot.idc
##D   # [1] 571
##D   atoms.dist[h2o.idc[1], nearby.prot]
##D   # [1] 3.571
##D   
## End(Not run)




