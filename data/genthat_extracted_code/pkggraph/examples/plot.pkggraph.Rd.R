library(pkggraph)


### Name: plot.pkggraph
### Title: plot a pkggraph object
### Aliases: plot.pkggraph

### ** Examples

## Not run: 
##D   pkggraph::init(local = TRUE)
##D   plot_obj <- pkggraph::neighborhood_graph("hash")
##D   plot(plot_obj)
##D 
##D   plot_obj <- pkggraph::neighborhood_graph("tidytext")
##D   plot(plot_obj
##D        , background     = "white"
##D        , nodeImportance = "out")
##D   plot_obj <- pkggraph::neighborhood_graph(c("hash","tokenizers")
##D                                            , interconnect = FALSE
##D                                            )
##D   plot(plot_obj,  background = "white")
##D   
## End(Not run)



