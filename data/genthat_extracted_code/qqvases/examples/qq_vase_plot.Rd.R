library(qqvases)


### Name: qq_vase_plot
### Title: Interactive QQ Vase Plot
### Aliases: qq_vase_plot

### ** Examples

## Not run: 
##D # default
##D qq_vase_plot()
##D 
##D # suppress sampling option
##D qq_vase_plot(FALSE)
##D 
##D # add uniform distribution to dialog
##D dists <- make_df_list()
##D dists[["uniform"]] <- list(d=dunif, q=qunif, r=runif)
##D qq_vase_plot(TRUE, dists)
##D 
##D # smaller increments, change the method that determines breaks in histogram
##D qq_vase_plot(TRUE, step=0.01, breaks=function(x) 2*sqrt(length(x)))
## End(Not run)



