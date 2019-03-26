library(compareGroups)


### Name: export2latex
### Title: Exporting descriptives table to LaTeX format
### Aliases: export2latex export2latex.createTable
###   export2latex.cbind.createTable
### Keywords: utilities

### ** Examples


## Not run: 
##D require(compareGroups)
##D data(regicor)
##D res <- compareGroups(sex ~. -id-todeath-death-tocv-cv, regicor)
##D export2latex(createTable(res, hide.no = 'n'), file=tempfile(fileext=".tex"))
## End(Not run)




