library(taxize)


### Name: tax_agg
### Title: Aggregate species data to given taxonomic rank
### Aliases: tax_agg print.tax_agg

### ** Examples

## Not run: 
##D if (requireNamespace("vegan", quietly = TRUE)) {
##D   # use dune dataset
##D   library("vegan")
##D   data(dune, package='vegan')
##D   species <- c("Bellis perennis", "Empetrum nigrum", "Juncus bufonius",
##D   "Juncus articulatus",
##D   "Aira praecox", "Eleocharis parvula", "Rumex acetosa", "Vicia lathyroides",
##D   "Brachythecium rutabulum", "Ranunculus flammula", "Cirsium arvense",
##D   "Hypochaeris radicata", "Leontodon autumnalis", "Potentilla palustris",
##D   "Poa pratensis", "Calliergonella cuspidata", "Trifolium pratense",
##D   "Trifolium repens", "Anthoxanthum odoratum", "Salix repens", "Achillea
##D   millefolium",
##D   "Poa trivialis", "Chenopodium album", "Elymus repens", "Sagina procumbens",
##D   "Plantago lanceolata", "Agrostis stolonifera", "Lolium perenne", "Alopecurus
##D   geniculatus", "Bromus hordeaceus")
##D   colnames(dune) <- species
##D 
##D   # aggregate sample to families
##D   (agg <- tax_agg(dune, rank = 'family', db = 'ncbi'))
##D 
##D   # extract aggregated community data matrix for further usage
##D   agg$x
##D   # check which taxa have been aggregated
##D   agg$by
##D }
##D 
##D # A use case where there are different taxonomic levels in the same dataset
##D spnames <- c('Puma','Ursus americanus','Ursidae')
##D df <- data.frame(c(1,2,3), c(11,12,13), c(1,4,50))
##D names(df) <- spnames
##D out <- tax_agg(df, rank = 'family', db='itis')
##D out$x
##D 
##D # You can input a matrix too
##D mat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3,
##D  dimnames=list(NULL, c('Puma concolor','Ursus americanus','Ailuropoda melanoleuca')))
##D tax_agg(mat, rank = 'family', db='itis')
## End(Not run)



