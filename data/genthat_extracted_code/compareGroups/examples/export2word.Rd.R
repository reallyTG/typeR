library(compareGroups)


### Name: export2word
### Title: Exports tables to Word files.
### Aliases: export2word
### Keywords: utilities

### ** Examples


## Not run: 
##D 
##D require(compareGroups)
##D data(regicor)
##D 
##D  # example on an ordinary table
##D res <- createTable(compareGroups(year ~ . -id, regicor), hide = c(sex=1), hide.no = 'no')
##D export2word(res, file = tempfile(fileext=".docx"))
##D 
## End(Not run)




