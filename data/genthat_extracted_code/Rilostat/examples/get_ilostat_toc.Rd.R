library(Rilostat)


### Name: get_ilostat_toc
### Title: Read Ilostat Table of Contents
### Aliases: get_ilostat_toc
### Keywords: database utilities

### ** Examples

## Not run: 
##D ## default segment by indicator, default lang English
##D 		toc <- get_ilostat_toc()
##D 		head(toc)
##D 		toc <- get_ilostat_toc(segment = 'ref_area', lang = 'fr')
##D 		head(toc)
##D ##
##D ## search on toc
##D   	toc <- get_ilostat_toc(search = 'education')
##D   	head(toc)
##D   	toc <- get_ilostat_toc(lang = 'fr', search = 'éducation')
##D   	head(toc)
##D   	toc <- get_ilostat_toc(segment = 'ref_area', lang = 'fr', search = 'Albanie')
##D   	toc
##D   	toc <- get_ilostat_toc(segment = 'ref_area', lang = 'es', search = 'Trimestral')
##D   	head(toc)
##D ##
##D ## search multi on toc
##D      toc <- get_ilostat_toc(segment = 'ref_area', lang = 'fr', 
##D              search = 'Albanie|France', fixed = FALSE)
##D 	head(toc)
##D 		toc <- get_ilostat_toc(search = 'youth|adult', fixed = FALSE)
##D 	head(toc)
##D 		toc <- get_ilostat_toc(search = c('youth','adult'), fixed = FALSE)
##D 	head(toc)
##D ##
## End(Not run)



