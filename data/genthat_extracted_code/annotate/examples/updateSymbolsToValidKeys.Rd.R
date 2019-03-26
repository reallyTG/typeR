library(annotate)


### Name: updateSymbolsToValidKeys
### Title: Take a list of symbols and translate them into the best possible
###   ID for a package.
### Aliases: updateSymbolsToValidKeys
### Keywords: manip

### ** Examples

## Not run: 
##D   ## one "bad" ID, one that can be mapped onto a valid ID, and a 3rd
##D   ## which already is a valid ID
##D   syms <- c("15S_rRNA_2","21S_rRNA_4","15S_rRNA")
##D   updateSymbolsToValidKeys(syms, "org.Sc.sgd")
##D 
##D   ## 3 symbols and a 4th that will NOT be valid
##D   syms <- c("MAPK11","P38B","FLJ45465", "altSymbol")
##D   updateSymbolsToValidKeys(syms, "org.Hs.eg")
## End(Not run)



