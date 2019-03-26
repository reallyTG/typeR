library(igraph)


### Name: predict_edges
### Title: Predict edges based on a hierarchical random graph model
### Aliases: predict_edges hrg.predict

### ** Examples

## We are not running these examples any more, because they
## take a long time (~15 seconds) to run and this is against the CRAN
## repository policy. Copy and paste them by hand to your R prompt if
## you want to run them.

## Not run: 
##D ## A graph with two dense groups
##D g <- sample_gnp(10, p=1/2) + sample_gnp(10, p=1/2)
##D hrg <- fit_hrg(g)
##D hrg
##D 
##D ## The consensus tree for it
##D consensus_tree(g, hrg=hrg, start=TRUE)
##D 
##D ## Prediction of missing edges
##D g2 <- make_full_graph(4) + (make_full_graph(4) - path(1,2))
##D predict_edges(g2)
## End(Not run)



