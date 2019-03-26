library(ALA4R)


### Name: search_fulltext
### Title: Full text search
### Aliases: search_fulltext

### ** Examples

## Not run: 
##D  # find information ALA holds on red kangaroo
##D  search_fulltext("red kangaroo")
##D  search_fulltext("Heleioporus australiacus")
##D  search_fulltext("urn:lsid:biodiversity.org.au:afd.taxon:31a9b8b8-4e8f-4343-a15f-2ed24e0bf1ae")
##D 
##D  # find genus names like "Oenanthe"
##D  search_fulltext("oenanthe", sort_by="rk_kingdom", fq="rank:genus")
## End(Not run)



