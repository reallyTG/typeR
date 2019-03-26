library(pander)


### Name: emphasize.rows
### Title: Emphasize rows/columns/cells
### Aliases: emphasize.rows emphasize.cols emphasize.cells
###   emphasize.strong.rows emphasize.strong.cols emphasize.strong.cells
###   emphasize.italics.rows emphasize.italics.cols emphasize.italics.cells
###   emphasize.verbatim.rows emphasize.verbatim.cols
###   emphasize.verbatim.cells

### ** Examples

## Not run: 
##D n <- data.frame(x = c(1,1,1,1,1), y = c(0,1,0,1,0))
##D emphasize.cols(1)
##D emphasize.rows(1)
##D pandoc.table(n)
##D 
##D emphasize.strong.cells(which(n == 1, arr.ind = TRUE))
##D pander(n)
## End(Not run)



