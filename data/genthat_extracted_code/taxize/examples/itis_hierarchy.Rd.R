library(taxize)


### Name: itis_hierarchy
### Title: ITIS hierarchy
### Aliases: itis_hierarchy

### ** Examples

## Not run: 
##D # Get full hierarchy
##D itis_hierarchy(tsn=180543)
##D 
##D # Get hierarchy upstream
##D itis_hierarchy(tsn=180543, "up")
##D 
##D # Get hierarchy downstream
##D itis_hierarchy(tsn=180543, "down")
##D 
##D # Many tsn's
##D itis_hierarchy(tsn=c(180543,41074,36616))
## End(Not run)



