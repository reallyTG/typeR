library(lmem.qtler)


### Name: mq.diagnostics
### Title: Performs molecular markers quality diagnostics.
### Aliases: mq.diagnostics

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
##D cross.data  <- qtl.cross (P.data, G.data, map.data,
##D cross='gwas', heterozygotes=FALSE, env=NUL)
##D summary (cross.data)
##D 
##D jittermap (cross.data)
##D 
##D Marker Quality
##D mq.diagnostics (crossobj=cross.data,I.threshold=0.1,
##D              p.val=0.01,na.cutoff=0.1)
## End(Not run)



