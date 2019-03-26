library(lmem.qtler)


### Name: pq.diagnostics
### Title: Performs phenotypic data quality diagnostics.
### Aliases: pq.diagnostics

### ** Examples

## Not run: 
##D data (SxM_geno)
##D data (SxM_map)
##D data (SxM_pheno)
##D 
##D P.data <- SxM_pheno
##D G.data <- SxM_geno
##D map.data <- SxM_map
##D 
##D cross.data <- qtl.cross (P.data, G.data, map.data,
##D cross='dh', heterozygotes = FALSE)
##D 
##D summary (cross.data)
##D jittermap (cross.data)
##D 
##D Pheno Quality
##D pq.diagnostics (crossobj=cross.data)
## End(Not run)



