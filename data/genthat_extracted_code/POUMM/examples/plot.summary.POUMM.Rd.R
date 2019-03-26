library(POUMM)


### Name: plot.summary.POUMM
### Title: Plot a summary of a POUMM fit
### Aliases: plot.summary.POUMM

### ** Examples

## Not run: 
##D library(POUMM)
##D 
##D set.seed(1)
##D 
##D N <- 1000
##D 
##D # create a random non-ultrametric tree of N tips
##D tree <- ape::rtree(N)  
##D 
##D # Simulate the evolution of a trait along the tree
##D z <- rVNodesGivenTreePOUMM(
##D   tree, g0 = 8, alpha = 1, theta = 4, sigma = 1.2, sigmae = .8)
##D 
##D fit <- POUMM(z[1:N], tree, spec = list(nSamplesMCMC = 4e5))
##D 
##D # Summarize the results from the fit in a table:
##D summary(fit)
##D 
##D # Create plots for some of the inferred parameters/statistics:
##D pl <- plot(fit, stat = c("alpha", "theta", "sigma", "sigmae", "H2tMean"), 
##D            doZoomIn = TRUE, 
##D            zoomInFilter = paste("!(stat %in% c('alpha', 'sigma', 'sigmae')) |",
##D                                 "(value >= 0 & value <= 8)"),
##D            doPlot = FALSE)
##D 
##D pl$traceplot
##D pl$densplot
## End(Not run)




