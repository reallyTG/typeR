library(valr)


### Name: db
### Title: Fetch data from remote databases.
### Aliases: db db_ucsc db_ensembl

### ** Examples

## Not run: 
##D if(require(RMySQL)) {
##D   ucsc <- db_ucsc('hg38')
##D 
##D   # fetch the `refGene` tbl
##D   tbl(ucsc, "refGene")
##D 
##D   # the `chromInfo` tbls have size information
##D   tbl(ucsc, "chromInfo")
##D }
## End(Not run)

## Not run: 
##D if(require(RMySQL)) {
##D   # squirrel genome
##D   ensembl <- db_ensembl('spermophilus_tridecemlineatus_core_67_2')
##D 
##D   tbl(ensembl, "gene")
##D }
## End(Not run)




