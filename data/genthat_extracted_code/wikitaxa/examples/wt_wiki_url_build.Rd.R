library(wikitaxa)


### Name: wt_wiki_url_build
### Title: Build MediaWiki Page URL
### Aliases: wt_wiki_url_build

### ** Examples

wt_wiki_url_build(wiki = "en", type = "wikipedia", page = "Malus domestica")
wt_wiki_url_build(
  wt_wiki_url_parse("https://en.wikipedia.org/wiki/Malus_domestica"))
wt_wiki_url_build("en", "wikipedia", "Malus domestica", api = TRUE)



