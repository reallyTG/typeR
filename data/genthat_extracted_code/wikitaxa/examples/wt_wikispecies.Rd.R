library(wikitaxa)


### Name: wt_wikispecies
### Title: WikiSpecies
### Aliases: wt_wikispecies wt_wikispecies_parse wt_wikispecies_search

### ** Examples

## Not run: 
##D # high level
##D wt_wikispecies(name = "Malus domestica")
##D wt_wikispecies(name = "Pinus contorta")
##D wt_wikispecies(name = "Ursus americanus")
##D wt_wikispecies(name = "Balaenoptera musculus")
##D 
##D # low level
##D pg <- wt_wiki_page("https://species.wikimedia.org/wiki/Abelmoschus")
##D wt_wikispecies_parse(pg)
##D 
##D # search wikispecies
##D wt_wikispecies_search(query = "pine tree")
##D 
##D ## use search results to dig into pages
##D res <- wt_wikispecies_search(query = "pine tree")
##D lapply(res$query$search$title[1:3], wt_wikispecies)
## End(Not run)



