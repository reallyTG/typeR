library(BSL)


### Name: plot.bsl
### Title: Plot method for class "bsl"
### Aliases: plot.bsl marginalPostDefault marginalPostGgplot

### ** Examples

## Not run: 
##D # pretend we had a bsl result
##D result <- new('bsl')
##D result@theta <- MASS::mvrnorm(10000, c(0.6, 0.2), diag(c(1, 1)))
##D result@M <- 10000
##D 
##D # plot using the R default plot function
##D par(mar = c(5, 4, 1, 2), oma = c(0, 1, 3, 0))
##D plot(result, which = 1, thin = 10, thetaTrue = c(0.6, 0.2),
##D      options.plot = list(cex.main = 1, col = 'red', lty = 2, lwd = 2, main = NA))
##D mtext('Approximate Univariate Posteriors', outer = TRUE, cex = 1.5)
##D 
##D # plot using the ggplot2 package
##D plot(result, which = 2, thin = 10, thetaTrue = c(0.6, 0.2),
##D      options.density = list(colour = 'darkblue', fill = 'grey80', size = 1),
##D      options.theme = list(plot.margin = grid::unit(rep(0.05,4), "npc"),
##D                           axis.text = ggplot2::element_text(size = 10)))
## End(Not run)




