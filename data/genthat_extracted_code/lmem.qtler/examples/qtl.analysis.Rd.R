library(lmem.qtler)


### Name: qtl.analysis
### Title: Performs a balanced population QTL mapping analysis.
### Aliases: qtl.analysis

### ** Examples

data (DHpop_pheno)
data (DHpop_geno)
data (DHpop_map)

G.data <- DHpop_geno
map.data <- DHpop_map
P.data <- DHpop_pheno

cross.data <- qtl.cross (P.data, G.data, map.data, cross='dh',
                         heterozygotes=FALSE)

summary (cross.data)

## Not run: 
##D QTL_SMA
##D QTL.result <- qtl.analysis (crossobj=cross.data,step=0,
##D method='SIM', trait="height", threshold="Li&Ji", distance=30, cofactors=NULL,
##D window.size=30)
## End(Not run)

# QTL_SIM
QTL.result <- qtl.analysis ( crossobj=cross.data, step=5,
method='SIM',trait="height", threshold="Li&Ji",
distance=30,cofactors=NULL,window.size=30)

# QTL CIM
cofactors <- as.vector (QTL.result$selected$marker)

QTL.result <- qtl.analysis ( crossobj=cross.data, step=5,
method='CIM', trait="height", threshold="Li&Ji", distance=30,
cofactors=cofactors, window.size=30)




