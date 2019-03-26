library(lmem.qtler)


### Name: qtl.memq
### Title: Performs Multi-Environment (or Multi-Trait) Multi-QTL analysis
###   for balanced populations.
### Aliases: qtl.memq

### ** Examples

 ## Not run: 
##D data (SxM_geno)
##D data (SxM_map)
##D data (SxMxE_pheno)
##D 
##D P.data <- SxMxE_pheno
##D G.data <- SxM_geno
##D map.data <- SxM_map
##D 
##D cross.data <- qtl.cross (P.data, G.data, map.data, cross='dh',
##D                          heterozygotes=FALSE)
##D 
##D summary (cross.data)
##D 
##D ## Pheno Quality
##D pq.diagnostics (crossobj=cross.data, boxplot =FALSE)
##D 
##D ## Marker Quality
##D mq.diagnostics (crossobj=cross.data,I.threshold=0.1,
##D              p.val=0.01,na.cutoff=0.1)
##D 
##D # QTL_SIM
##D QTL.result <- qtl.memq (crossobj = cross.data, P.data = P.data,
##D                         env.label = c('ID91','ID92','MAN92','MTd91',
##D                         'MTd92','MTi91','MTi92','SKs92','WA91','WA92'),
##D                         trait = 'yield', step = 10, method = 'SIM',
##D                         threshold = 'Li&Ji', distance = 50, cofactors = NULL,
##D                         window.size = 50)
##D 
##D ## QTL_CIM
##D QTL.result <- qtl.memq (crossobj = cross.data, P.data = P.data,
##D                        env.label = c('ID91','ID92','MAN92','MTd91','MTd92',
##D                        'MTi91','MTi92','SKs92','WA91','WA92'),
##D                        trait = 'yield', step = 10, method = 'CIM',
##D                        threshold = 'Li&Ji', distance = 50,
##D                        cofactors = QTL.result$selected$marker, window.size = 50)
## End(Not run)



