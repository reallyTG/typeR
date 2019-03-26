library(bold)


### Name: bold_tax_name
### Title: Search BOLD for taxonomy data by taxonomic name
### Aliases: bold_tax_name

### ** Examples

## Not run: 
##D bold_tax_name(name='Diplura')
##D bold_tax_name(name='Osmia')
##D bold_tax_name(name=c('Diplura','Osmia'))
##D bold_tax_name(name=c("Apis","Puma concolor","Pinus concolor"))
##D bold_tax_name(name='Diplur', fuzzy=TRUE)
##D bold_tax_name(name='Osm', fuzzy=TRUE)
##D 
##D ## get http response object only
##D bold_tax_name(name='Diplura', response=TRUE)
##D bold_tax_name(name=c('Diplura','Osmia'), response=TRUE)
##D 
##D ## Names with no data in BOLD database
##D bold_tax_name("Nasiaeshna pentacantha")
##D bold_tax_name(name = "Cordulegaster erronea")
##D bold_tax_name(name = "Cordulegaster erronea", response=TRUE)
##D 
##D ## curl debugging
##D bold_tax_name(name='Diplura', verbose = TRUE)
## End(Not run)



