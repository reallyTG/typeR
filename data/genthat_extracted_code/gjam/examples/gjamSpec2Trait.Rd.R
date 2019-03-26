library(gjam)


### Name: gjamSpec2Trait
### Title: Ecological traits for gjam analysis
### Aliases: gjamSpec2Trait

### ** Examples

## Not run: 
##D library(repmis)
##D source_data("https://github.com/jimclarkatduke/gjam/blob/master/forestTraits.RData?raw=True")
##D 
##D xdata       <- forestTraits$xdata
##D plotByTree  <- gjamReZero(forestTraits$treesDeZero) # re-zero
##D traitTypes  <- forestTraits$traitTypes
##D specByTrait <- forestTraits$specByTrait
##D 
##D tmp <- gjamSpec2Trait(pbys = plotByTree, sbyt = specByTrait, 
##D                       tTypes = traitTypes)
##D tTypes <- tmp$traitTypes
##D traity <- tmp$plotByCWM
##D censor <- tmp$censor
##D 
##D ml  <- list(ng=2000, burnin=500, typeNames = tTypes, censor = censor)
##D out <- gjam(~ temp + stdage + deficit, xdata, ydata = traity, modelList = ml)
##D pl  <- list(SMALLPLOTS=F)           
##D gjamPlot(output = out, plotPars = pl)         
## End(Not run)



