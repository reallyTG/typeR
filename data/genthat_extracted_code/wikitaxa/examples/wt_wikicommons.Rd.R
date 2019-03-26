library(wikitaxa)


### Name: wt_wikicommons
### Title: WikiCommons
### Aliases: wt_wikicommons wt_wikicommons_parse wt_wikicommons_search

### ** Examples

## Not run: 
##D # high level
##D wt_wikicommons(name = "Malus domestica")
##D wt_wikicommons(name = "Pinus contorta")
##D wt_wikicommons(name = "Ursus americanus")
##D wt_wikicommons(name = "Balaenoptera musculus")
##D 
##D wt_wikicommons(name = "Category:Poeae")
##D wt_wikicommons(name = "Category:Pinaceae")
##D 
##D # low level
##D pg <- wt_wiki_page("https://commons.wikimedia.org/wiki/Malus_domestica")
##D wt_wikicommons_parse(pg)
##D 
##D # search wikicommons
##D wt_wikicommons_search(query = "Pinus")
##D 
##D ## use search results to dig into pages
##D res <- wt_wikicommons_search(query = "Pinus")
##D lapply(res$query$search$title[1:3], wt_wikicommons)
## End(Not run)



