library(poppr)


### Name: poppr
### Title: Produce a basic summary table for population genetic analyses.
### Aliases: poppr

### ** Examples

data(nancycats)
poppr(nancycats)

## Not run: 
##D # Sampling
##D poppr(nancycats, sample = 999, total = FALSE, plot = TRUE)
##D 
##D # Customizing the plot
##D library("ggplot2")
##D p <- last_plot()
##D p + facet_wrap(~population, scales = "free_y", ncol = 1)
##D 
##D # Turning off diversity statistics (see get_stats)
##D poppr(nancycats, total=FALSE, H = FALSE, G = FALSE, lambda = FALSE, E5 = FALSE)
##D 
##D # The previous version of poppr contained a definition of Hexp, which
##D # was calculated as (N/(N - 1))*lambda. It basically looks like an unbiased 
##D # Simpson's index. This statistic was originally included in poppr because it
##D # was originally included in the program multilocus. It was finally figured
##D # to be an unbiased Simpson's diversity metric (Lande, 1996; Good, 1953).
##D 
##D data(Aeut)
##D 
##D uSimp <- function(x){
##D   lambda <- vegan::diversity(x, "simpson")
##D   x <- drop(as.matrix(x))
##D   if (length(dim(x)) > 1){
##D     N <- rowSums(x)
##D   } else {
##D     N <- sum(x)
##D   }
##D   return((N/(N-1))*lambda)
##D }
##D poppr(Aeut, uSimp = uSimp)
##D 
##D 
##D # Demonstration with viral data
##D # Note: this is a larger data set that could take a couple of minutes to run
##D # on slower computers. 
##D data(H3N2)
##D strata(H3N2) <- data.frame(other(H3N2)$x)
##D setPop(H3N2) <- ~country
##D poppr(H3N2, total = FALSE, sublist=c("Austria", "China", "USA"), 
##D 				clonecorrect = TRUE, strata = ~country/year)
## End(Not run)



