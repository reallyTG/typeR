library(compareGroups)


### Name: export2html
### Title: Exporting descriptives table to HTML format
### Aliases: export2html
### Keywords: utilities

### ** Examples


## Not run: 
##D require(compareGroups)
##D data(regicor)
##D res <- compareGroups(sex ~. -id-todeath-death-tocv-cv, regicor)
##D export2html(createTable(res, hide.no = 'n'), file=tempfile(fileext=".html"))
## End(Not run)




