library(extRemes)


### Name: extremalindex
### Title: Extemal Index
### Aliases: extremalindex ci.extremalindex print.extremalindex
### Keywords: univar

### ** Examples

data(Fort)

extremalindex(Fort$Prec, 0.395, method="runs", run.length=9, blocks=Fort$year)

## Not run: 
##D tmp <- extremalindex(Fort$Prec, 0.395, method="runs", run.length=9, blocks=Fort$year)
##D tmp
##D ci(tmp)
##D 
##D tmp <- extremalindex(Fort$Prec, 0.395, method="intervals", run.length=9, blocks=Fort$year)
##D tmp
##D ci(tmp)
##D 
## End(Not run)



