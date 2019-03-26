library(NetOrigin)


### Name: plot_performance
### Title: A plot method combining a time series of performance results.
### Aliases: plot_performance

### ** Examples

## Not run: 
##D  
##D ### delays on Goettingen bus network
##D # compute effective distance
##D data(ptnGoe)
##D goenet <- igraph::as_adjacency_matrix(ptnGoe, sparse=FALSE)
##D p <- goenet/rowSums(goenet)
##D eff <- eff_dist(p)
##D # apply source estimation
##D data(delayGoe)
##D if (requireNamespace("aplyr", quietly = TRUE)) {
##D    res <- alply(.data=delayGoe[11:20,-c(1:2)], .margins=1, .fun=origin_edm, 
##D                 distance=eff, silent=TRUE, .progress='text')
##D    perfGoe <- ldply(Map(performance, x = res, start = 2, list(graph = ptnGoe)))
##D    # performance plots
##D    plot_performance(perfGoe, var='rank', ylab='rank of correct detection', text.padding=0.5)
##D    plot_performance(perfGoe, var='dist', ylab='distance to correct detection')
##D }
##D 
##D ### delays on Athens metro network
##D # compute effective distance
##D data(ptnAth)
##D athnet <- igraph::as_adjacency_matrix(ptnAth, sparse=FALSE)
##D p <- athnet/rowSums(athnet)
##D eff <- eff_dist(p)
##D # apply source estimation
##D data(delayAth)
##D if (requireNamespace("aplyr", quietly = TRUE)) {
##D    res <- alply(.data=delayAth[11:20,-c(1:2)], .margins=1, .fun=origin_edm, 
##D              distance=eff, silent=TRUE, .progress='text')
##D    perfAth <- ldply(Map(performance, x = res, start = as.list(delayAth$k0),
##D                      list(graph = ptnAth)))
##D    # performance plots
##D    plot_performance(perfAth, var='rank', ylab='rank of correct detection',text.padding=0.5)
##D    plot_performance(perfAth, var='dist', ylab='distance to correct detection')
##D }
## End(Not run)



