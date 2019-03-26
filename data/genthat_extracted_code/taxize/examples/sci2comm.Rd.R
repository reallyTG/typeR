library(taxize)


### Name: sci2comm
### Title: Get common names from scientific names.
### Aliases: sci2comm sci2comm.default sci2comm.uid sci2comm.tsn
###   sci2comm.wormsid sci2comm.iucn

### ** Examples

## Not run: 
##D sci2comm(scinames='Helianthus annuus', db='eol')
##D sci2comm(scinames='Helianthus annuus', db='itis')
##D sci2comm(scinames=c('Helianthus annuus', 'Poa annua'))
##D sci2comm(scinames='Puma concolor', db='ncbi')
##D sci2comm('Gadus morhua', db='worms')
##D sci2comm('Pomatomus saltatrix', db='worms')
##D sci2comm('Loxodonta africana', db='iucn')
##D 
##D # Passing id in, works for sources: itis and ncbi, not eol
##D sci2comm(get_tsn('Helianthus annuus'))
##D sci2comm(get_uid('Helianthus annuus'))
##D sci2comm(get_wormsid('Gadus morhua'))
##D sci2comm(get_iucn('Loxodonta africana'))
##D 
##D # Don't simplify returned
##D sci2comm(get_tsn('Helianthus annuus'), simplify=FALSE)
##D sci2comm(get_iucn('Loxodonta africana'), simplify=FALSE)
##D 
##D # Use curl options
##D sci2comm('Helianthus annuus', db="ncbi", verbose = TRUE)
## End(Not run)



