library(taxize)


### Name: get_wiki
### Title: Get the page name for a Wiki taxon
### Aliases: get_wiki as.wiki as.wiki.wiki as.wiki.character as.wiki.list
###   as.wiki.numeric as.wiki.data.frame as.data.frame.wiki get_wiki_

### ** Examples

## Not run: 
##D get_wiki(x = "Quercus douglasii")
##D get_wiki(x = "Quercu")
##D get_wiki(x = "Quercu", "pedia")
##D get_wiki(x = "Quercu", "commons")
##D 
##D # diff. wikis with wikipedia
##D get_wiki("Malus domestica", "pedia")
##D get_wiki("Malus domestica", "pedia", "fr")
##D 
##D # as coercion
##D as.wiki("Malus_domestica")
##D as.wiki("Malus_domestica", wiki_site = "commons")
##D as.wiki("Malus_domestica", wiki_site = "pedia")
##D as.wiki("Malus_domestica", wiki_site = "pedia", wiki = "fr")
##D as.wiki("Malus_domestica", wiki_site = "pedia", wiki = "da")
## End(Not run)



