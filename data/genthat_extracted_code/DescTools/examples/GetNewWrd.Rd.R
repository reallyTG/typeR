library(DescTools)


### Name: GetNewWrd
### Title: Create a New Word Instance
### Aliases: GetNewWrd WrdKill createCOMReference
### Keywords: misc

### ** Examples

## Not run: 
##D  # Windows-specific example
##D 
##D wrd <- GetNewWrd()
##D Desc(d.pizza[,1:4], wrd=wrd)
##D 
##D wrd <- GetNewWrd(header=TRUE)
##D Desc(d.pizza[,1:4], wrd=wrd)
##D 
##D # enumerate all bookmarks in active document
##D for(i in 1:wrd[["ActiveDocument"]][["Bookmarks"]]$count()){
##D   print(wrd[["ActiveDocument"]][["Bookmarks"]]$Item(i)$Name())
##D }
## End(Not run)



