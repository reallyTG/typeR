library(HGNChelper)


### Name: getCurrentMaps
### Title: Get the current maps for correcting gene symbols
### Aliases: getCurrentMaps getCurrentHumanMap getCurrentMouseMap

### ** Examples

## Not run: 
##D ## human
##D new.hgnc.table <- getCurrentHumanMap()
##D checkGeneSymbols(c("3-Oct", "10-3", "tp53"), map=new.hgnc.table)
##D ## mouse
##D new.mouse.table <- getCurrentMouseMap()
##D ## Set species to NULL or "mouse" 
##D ## so that human-like capitalization corrections aren't made
##D checkGeneSymbols(c("Gm46568", "1-Feb"), map=new.mouse.table, species="mouse")
## End(Not run)




