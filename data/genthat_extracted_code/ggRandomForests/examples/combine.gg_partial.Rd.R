library(ggRandomForests)


### Name: combine.gg_partial
### Title: combine two gg_partial objects
### Aliases: combine.gg_partial combine.gg_partial_list

### ** Examples

## Not run: 
##D # Load a set of plot.variable partial plot data
##D data(partial_pbc)
##D 
##D # A list of 2 plot.variable objects
##D length(partial_pbc) 
##D class(partial_pbc)
##D 
##D class(partial_pbc[[1]])
##D class(partial_pbc[[2]])
##D 
##D # Create gg_partial objects
##D ggPrtl.1 <- gg_partial(partial_pbc[[1]])
##D ggPrtl.2 <- gg_partial(partial_pbc[[2]])
##D 
##D # Combine the objects to get multiple time curves 
##D # along variables on a single figure.
##D ggpart <- combine.gg_partial(ggPrtl.1, ggPrtl.2, 
##D                              lbls = c("1 year", "3 years"))
##D                              
##D # Plot each figure separately
##D plot(ggpart)                                  
##D 
##D # Get the continuous data for a panel of continuous plots.
##D ggcont <- ggpart
##D ggcont$edema <- ggcont$ascites <- ggcont$stage <- NULL
##D plot(ggcont, panel=TRUE) 
##D 
##D # And the categorical for a panel of categorical plots.
##D nms <- colnames(sapply(ggcont, function(st){st}))
##D for(ind in nms){
##D    ggpart[[ind]] <- NULL
##D }
##D plot(ggpart, panel=TRUE) 
## End(Not run)




