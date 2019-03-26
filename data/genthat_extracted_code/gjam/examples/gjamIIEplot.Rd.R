library(gjam)


### Name: gjamIIEplot
### Title: Plots indirect effects and interactions for gjam data
### Aliases: gjamIIEplot

### ** Examples

## Not run: 
##D sim <- gjamSimData(S = 10, Q = 6, typeNames = 'OC')
##D ml  <- list(ng = 50, burnin = 5, typeNames = sim$typeNames)
##D out <- gjam(sim$formula, sim$xdata, sim$ydata, modelList = ml)
##D 
##D xvector <- colMeans(out$inputs$x)  #predict at mean values for data
##D xvector[1] <- 1
##D 
##D fit <- gjamIIE(out, xvector)
##D 
##D gjamIIEplot(fit, response = 'S1', effectMu = c('main','ind'), 
##D             effectSd = c('main','ind'), legLoc = 'topleft')
## End(Not run)



