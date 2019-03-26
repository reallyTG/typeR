library(taxize)


### Name: fungorum
### Title: Index Fungorum
### Aliases: fungorum fg_name_search fg_author_search fg_epithet_search
###   fg_name_by_key fg_name_full_by_lsid fg_all_updated_names
###   fg_deprecated_names

### ** Examples

## Not run: 
##D # NameSearch
##D fg_name_search(q = "Gymnopus", limit = 2)
##D fg_name_search(q = "Gymnopus")
##D 
##D # EpithetSearch
##D fg_epithet_search(q = "phalloides")
##D 
##D # NameByKey
##D fg_name_by_key(17703)
##D 
##D # NameFullByKey
##D fg_name_full_by_lsid("urn:lsid:indexfungorum.org:names:81085")
##D 
##D # AllUpdatedNames
##D fg_all_updated_names(date = gsub("-", "", Sys.Date() - 2))
##D 
##D # DeprecatedNames
##D fg_deprecated_names(date=20151001)
##D 
##D # AuthorSearch
##D fg_author_search(q = "Fayod", limit = 2)
## End(Not run)



