library(wikitaxa)


### Name: wt_data
### Title: Wikidata taxonomy data
### Aliases: wt_data wt_data_id

### ** Examples

## Not run: 
##D # search by taxon name
##D # wt_data("Mimulus alsinoides")
##D 
##D # choose which properties to return
##D wt_data(x="Mimulus foliatus", property = c("P846", "P815"))
##D 
##D # get a taxonomic identifier
##D wt_data_id("Mimulus foliatus")
##D # the id can be passed directly to wt_data()
##D # wt_data(wt_data_id("Mimulus foliatus"))
## End(Not run)



