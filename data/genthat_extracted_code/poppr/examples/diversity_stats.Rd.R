library(poppr)


### Name: diversity_stats
### Title: Produce a table of diversity statistics
### Aliases: diversity_stats

### ** Examples

library(poppr)
data(Pinf)
tab <- mlg.table(Pinf, plot = FALSE)
diversity_stats(tab)
## Not run: 
##D # Example using the poweRlaw package to calculate the negative slope of the
##D # Pareto distribution.
##D 
##D library("poweRlaw")
##D power_law_beta <- function(x){
##D   xpow <- displ(x[x > 0])                 # Generate the distribution
##D   xpow$setPars(estimate_pars(xpow))       # Estimate the parameters
##D   xdat <- plot(xpow, draw = FALSE)        # Extract the data
##D   xlm <- lm(log(y) ~ log(x), data = xdat) # Run log-log linear model for slope
##D   return(-coef(xlm)[2])
##D }
##D 
##D Beta <- function(x){
##D   x <- drop(as.matrix(x))
##D   if (length(dim(x)) > 1){
##D     res <- apply(x, 1, power_law_beta)
##D   } else {
##D     res <- power_law_beta(x)
##D   }
##D   return(res)
##D }
##D 
##D diversity_stats(tab, B = Beta)
## End(Not run)



