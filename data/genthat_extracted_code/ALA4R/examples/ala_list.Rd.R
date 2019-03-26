library(ALA4R)


### Name: ala_list
### Title: Species lists
### Aliases: ala_list

### ** Examples

## Not run: 
##D  all_lists <- ala_lists()
##D  ## find the "Field Guide apps species profiles" from Museum Victoria
##D  all_lists[grep("Field Guide", all_lists$listName), ]
##D 
##D  ## download the vertebrates one
##D  l <- ala_list(druid="dr1146")
## End(Not run)




