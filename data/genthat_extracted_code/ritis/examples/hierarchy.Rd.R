library(ritis)


### Name: hierarchy
### Title: Get hierarchy down from tsn
### Aliases: hierarchy hierarchy_down hierarchy_up hierarchy_full

### ** Examples

## Not run: 
##D ## Full down (class Mammalia)
##D hierarchy_down(tsn=179913)
##D 
##D ## Full up (genus Agoseris)
##D hierarchy_up(tsn=36485)
##D 
##D ## Full hierarchy
##D ### genus Liatris
##D hierarchy_full(tsn=37906)
##D ### get raw data back
##D hierarchy_full(tsn=37906, raw = TRUE)
##D ### genus Baetis, get xml back
##D hierarchy_full(100800, wt = "xml")
## End(Not run)



