library(compareGroups)


### Name: export2csv
### Title: Exporting descriptives table to plain text (CSV) format
### Aliases: export2csv
### Keywords: utilities

### ** Examples


## Not run: 
##D require(compareGroups)
##D data(regicor)
##D res <- compareGroups(sex ~. -id-todeath-death-tocv-cv, regicor)
##D export2csv(createTable(res, hide.no = 'n'), file=tempfile(fileext=".csv"))
## End(Not run)




