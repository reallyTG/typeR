library(gjam)


### Name: gjamIIE
### Title: Indirect effects and interactions for gjam data
### Aliases: gjamIIE

### ** Examples

## Not run: 
##D sim <- gjamSimData(S = 12, Q = 5, typeNames = 'CA')
##D ml  <- list(ng = 50, burnin = 5, typeNames = sim$typeNames)
##D out <- gjam(sim$formula, sim$xdata, sim$ydata, modelList = ml)
##D 
##D xvector <- colMeans(out$inputs$x)  #predict at mean values for data
##D xvector[1] <- 1
##D 
##D fit <- gjamIIE(output = out, xvector)
##D 
##D gjamIIEplot(fit, response = 'S1', effectMu = c('main','ind'), 
##D             effectSd = c('main','ind'), legLoc = 'topleft')
## End(Not run)



