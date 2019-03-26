library(wikitaxa)


### Name: wt_wikipedia
### Title: Wikipedia
### Aliases: wt_wikipedia wt_wikipedia_parse wt_wikipedia_search

### ** Examples

## Not run: 
##D # high level
##D wt_wikipedia(name = "Malus domestica")
##D wt_wikipedia(name = "Malus domestica", wiki = "fr")
##D wt_wikipedia(name = "Malus domestica", wiki = "da")
##D 
##D # low level
##D pg <- wt_wiki_page("https://en.wikipedia.org/wiki/Malus_domestica")
##D wt_wikipedia_parse(pg)
##D wt_wikipedia_parse(pg, tidy = TRUE)
##D 
##D # search wikipedia
##D wt_wikipedia_search(query = "Pinus")
##D wt_wikipedia_search(query = "Pinus", wiki = "fr")
##D wt_wikipedia_search(query = "Pinus", wiki = "br")
##D 
##D ## curl options
##D # wt_wikipedia_search(query = "Pinus", verbose = TRUE)
##D 
##D ## use search results to dig into pages
##D res <- wt_wikipedia_search(query = "Pinus")
##D lapply(res$query$search$title[1:3], wt_wikipedia)
## End(Not run)



