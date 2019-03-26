library(compareGroups)


### Name: export2pdf
### Title: Exports tables to PDF files.
### Aliases: export2pdf
### Keywords: utilities

### ** Examples


## Not run: 
##D 
##D require(compareGroups)
##D data(regicor)
##D 
##D  # example on an ordinary table
##D res <- createTable(compareGroups(year ~ . -id, regicor), hide = c(sex=1), hide.no = 'no')
##D export2pdf(res, file=tempfile(fileext=".pdf"), size="small")
##D 
## End(Not run)




