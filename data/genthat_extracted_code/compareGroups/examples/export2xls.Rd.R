library(compareGroups)


### Name: export2xls
### Title: Exporting descriptives table to Exel format (.xlsx or .xls)
### Aliases: export2xls
### Keywords: utilities

### ** Examples


## Not run: 
##D require(compareGroups)
##D data(regicor)
##D res <- compareGroups(sex ~. -id-todeath-death-tocv-cv, regicor)
##D export2xls(createTable(res, hide.no = 'n'), file=tempfile(fileext=".xlsx"))
## End(Not run)




