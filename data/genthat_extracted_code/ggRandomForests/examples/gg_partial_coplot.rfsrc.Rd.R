library(ggRandomForests)


### Name: gg_partial_coplot.rfsrc
### Title: Data structures for stratified partial coplots
### Aliases: gg_partial_coplot gg_partial_coplot.rfsrc

### ** Examples

## Not run: 
##D # Load the forest
##D data(rfsrc_pbc, package="ggRandomForests")
##D 
##D # Create the variable plot.
##D ggvar <- gg_variable(rfsrc_pbc, time = 1)
##D 
##D # Find intervals with similar number of observations.
##D copper_cts <-quantile_pts(ggvar$copper, groups = 6, intervals = TRUE)
##D 
##D # Create the conditional groups and add to the gg_variable object
##D copper_grp <- cut(ggvar$copper, breaks = copper_cts)
## End(Not run)
## Not run: 
##D ## We would run this, but it's expensive 
##D partial_coplot_pbc <- gg_partial_coplot(rfsrc_pbc, xvar = "bili", 
##D                                          groups = copper_grp, 
##D                                          surv_type = "surv", 
##D                                          time = 1, 
##D                                          show.plots = FALSE)
## End(Not run)
## Not run: 
##D ## so load the cached set
##D data(partial_coplot_pbc, package="ggRandomForests")
##D 
##D # Partial coplot
##D plot(partial_coplot_pbc) #, se = FALSE)
##D  
## End(Not run)




