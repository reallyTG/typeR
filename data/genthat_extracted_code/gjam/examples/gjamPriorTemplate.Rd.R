library(gjam)


### Name: gjamPriorTemplate
### Title: Prior coefficients for gjam analysis
### Aliases: gjamPriorTemplate

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
##D formula <- as.formula(~ temp + deficit)
##D lo <- list(temp_ring = 0, deficit_drought = 0) # positive combinations
##D b  <- gjamPriorTemplate(formula, xdata, ydata = traity, lo = lo, hi = hi)
##D bp <- list(loBeta = b$lo, hiBeta = b$hi)
##D 
##D ml <- list(ng=4000, burnin=1000, typeNames = tTypes, censor = censor, 
##D             betaPrior = bp)
##D out <- gjam(formula, xdata, ydata = traity, modelList = ml)
##D 
##D S   <- ncol(traity)
##D sc  <- rep('black',S)
##D sc[colnames(traity) ##D 
##D pl  <- list(SMALLPLOTS=F, specColor=sc)           
##D gjamPlot(output = out, plotPars = pl)         
## End(Not run)



