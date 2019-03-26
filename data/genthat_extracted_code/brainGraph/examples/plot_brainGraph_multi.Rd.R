library(brainGraph)


### Name: plot_brainGraph_multi
### Title: Save PNG of three views of a brain graph
### Aliases: plot_brainGraph_multi

### ** Examples

## Not run: 
##D plot_brainGraph_multi(g.hubs, groups=1:2, filename='Figure01_hubs.png',
##D   subgraph='N > 0', vertex.color='color.lobe', vertex.size=15,
##D   show.legend=TRUE, vertex.label.cex=1.5)
##D ## Single group, different subgraphs for each plot
##D plot_brainGraph_multi(g, groups=c(1, 1), N=5, filename='5_6core.png',
##D   vertex.color='color.lobe', edge.color='color.lobe', vertex.label=NA,
##D   subgraph=list('coreness > 5', 'coreness > 6'),
##D   main=list('k-core 5', 'k-core 6'))
## End(Not run)



