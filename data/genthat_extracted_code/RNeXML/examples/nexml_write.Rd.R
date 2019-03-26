library(RNeXML)


### Name: nexml_write
### Title: Write nexml files
### Aliases: nexml_write write.nexml

### ** Examples

 ## Write an ape tree to nexml, analgous to write.nexus:
 library(ape); data(bird.orders)
 write.nexml(bird.orders, file="example.xml")

## Not run: 
##D  # takes > 5s
##D  ## Assemble a nexml section by section and then write to file:
##D  library(geiger)
##D  data(geospiza)
##D  nexml <- add_trees(geospiza$phy) # creates new nexml
##D  nexml <- add_characters(geospiza$dat, nexml = nexml) # pass the nexml obj to append character data
##D  nexml <- add_basic_meta(title="my title", creator = "Carl Boettiger", nexml = nexml)
##D  nexml <- add_meta(meta("prism:modificationDate", format(Sys.Date())), nexml = nexml)
##D 
##D  write.nexml(nexml, file="example.xml")
##D 
##D  ## As above, but in one call (except for add_meta() call).  
##D  write.nexml(trees = geospiza$phy, 
##D              characters = geospiza$dat, 
##D              title = "My title", 
##D              creator = "Carl Boettiger",
##D              file = "example.xml")
##D  
##D  ## Mix and match: identical to the section by section: 
##D  nexml <- add_meta(meta("prism:modificationDate", format(Sys.Date())))
##D  write.nexml(x = nexml,
##D              trees = geospiza$phy, 
##D              characters = geospiza$dat, 
##D              title = "My title", 
##D              creator = "Carl Boettiger",
##D              file = "example.xml")
##D 
## End(Not run)



