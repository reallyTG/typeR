library(gllvm)


### Name: getResidualCor.gllvm
### Title: Extract residual correlations from gllvm object
### Aliases: getResidualCor.gllvm getResidualCor

### ** Examples

# Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
# Fit gllvm model
fit <- gllvm(y = y, family = poisson())
# residual correlations:
cr <- getResidualCor(fit)

## Not run: 
##D # Plot residual correlations:
##D install.packages("corrplot", "gclus")
##D library(corrplot)
##D library(gclus)
##D rbPal <- colorRampPalette(c('darkblue', 'white', 'darkred'))
##D breaks <- seq(min(cr$cor), max(cr$cor), length.out = 40)
##D Colors <- rbPal(100)[as.numeric(cut(cr$cor, breaks = breaks))]
##D corrplot(cr$cor[order.single(cr$cor), order.single(cr$cor)], diag = F,
##D   type = "lower", method = "square", tl.cex = 0.8, tl.srt = 45, tl.col = "red")
##D   
## End(Not run)




