library(BurStMisc)


### Name: scriptSearch
### Title: Search R scripts for text
### Aliases: scriptSearch
### Keywords: character

### ** Examples

## Not run: 
##D scriptSearch("list.files")
##D scriptSearch("garch", "~/../burns-stat3/webpages/blog")
##D 
##D # search for an assignment
##D # ' *' means zero or more spaces
##D scriptSearch("specialObject *<- ", "~/myScriptDirectory", subdirs=FALSE)
##D 
##D # search COBOL files
##D scriptSearch("blah", suffix="\\.cbl$")
##D 
## End(Not run)



