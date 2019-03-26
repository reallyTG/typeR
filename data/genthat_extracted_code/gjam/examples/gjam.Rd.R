library(gjam)


### Name: gjam
### Title: Gibbs sampler for gjam data
### Aliases: gjam print.gjam summary.gjam

### ** Examples

## Not run: 
##D ## combinations of scales
##D types <- c('DA','DA','OC','OC','OC','OC','CC','CC','CC','CC','CC','CA','CA','PA','PA')         
##D f    <- gjamSimData(S = length(types), typeNames = types)
##D ml   <- list(ng = 50, burnin = 5, typeNames = f$typeNames)
##D out  <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D summary(out)
##D 
##D # repeat with ng = 5000, burnin = 500, then plot data:
##D pl  <- list(trueValues = f$trueValues, SMALLPLOTS=F)
##D gjamPlot(out, plotPars = pl)
##D 
##D ## discrete abundance with heterogeneous effort 
##D S   <- 5                             
##D n   <- 1000
##D eff <- list( columns = 1:S, values = round(runif(n,.5,5),1) )
##D f   <- gjamSimData(n, S, typeNames='DA', effort=eff)
##D ml  <- list(ng = 500, burnin = 50, typeNames = f$typeNames, effort = eff)
##D out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D summary(out)
##D 
##D # repeat with ng = 2000, burnin = 500, then plot data:
##D pl  <- list(trueValues = f$trueValues)
##D gjamPlot(out, plotPars = pl)
## End(Not run)



