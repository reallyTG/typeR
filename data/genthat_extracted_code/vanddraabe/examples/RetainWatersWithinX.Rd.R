library(vanddraabe)


### Name: RetainWatersWithinX
### Title: Retain Waters Within X Angstroms of Protein
### Aliases: RetainWatersWithinX

### ** Examples

  ## No test: 
  ##--- determine the protein, hetatom, and  water indices
  prot.het.h2o.idc <- ProtHetWatIndices(data=PDB.1hah.aoi.clean)

  ##--- calculate the distances
  atoms.dist <- as.matrix(dist(PDB.1hah.aoi.clean[, c("x","y","z")],
                               method="euclidean",
                               diag=TRUE, upper=TRUE))
  diag(atoms.dist) <- NA

  water.idc.within.6 <- RetainWatersWithinX(atoms.dist,
                                            prot.het.h2o.idc,
                                            cutoff.prot.h2o.dist=6.0)
  # - 204 of the 204 water oxygen atoms are within 6 Angstroms of the protein
  
## End(No test)




