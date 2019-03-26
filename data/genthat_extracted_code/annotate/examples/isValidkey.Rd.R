library(annotate)


### Name: isValidKey
### Title: Get or verify valid IDs for a package or OrgDb object.
### Aliases: isValidKey allValidKeys isValidKey,character,character-method
###   isValidKey,character,OrgDb-method allValidKeys,character-method
###   allValidKeys,OrgDb-method
### Keywords: manip

### ** Examples

## Not run: 
##D   ## 2 bad IDs and a 3rd that will be valid
##D   ids <- c("15S_rRNA_2","21S_rRNA_4","15S_rRNA")
##D   isValidKey(ids, "org.Sc.sgd")
##D 
##D   ## 2 good IDs and a 3rd that will not be valid
##D   ids <- c("5600","7531", "altSymbol")
##D   isValidKey(ids, "org.Hs.eg")
##D 
##D   ## Get all the valid primary id from org.Hs.eg.db
##D   allValidKeys("org.Hs.eg")
## End(Not run)



