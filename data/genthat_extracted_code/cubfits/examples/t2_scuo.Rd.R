library(cubfits)


### Name: SCUO Index
### Title: Function for Synonymous Codon Usage Order (SCUO) Index
### Aliases: calc_scuo_values
### Keywords: tool

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D 
##D y.scuo <- convert.y.to.scuo(ex.train$y)
##D SCUO <- calc_scuo_values(y.scuo)$SCUO
##D plotprxy(ex.train$phi.Obs, SCUO, ylab = "SCUO (log10)")
## End(Not run)



