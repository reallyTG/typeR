library(miic)


### Name: miic
### Title: MIIC, causal network learning algorithm including latent
###   variables
### Aliases: miic

### ** Examples

library(miic)

# EXAMPLE HEMATOPOIESIS
data(hematoData)

# execute MIIC (reconstruct graph)
miic.res = miic(inputData = hematoData, latent = TRUE,
confidenceShuffle = 10, confidenceThreshold = 0.001)

# plot graph
miic.plot(miic.res)
## Not run: 
##D 
##D # write graph to graphml format. Note that to correctly visualize
##D # the network we created the miic style for Cytoscape (http://www.cytoscape.org/).
##D 
##D miic.write.network.cytoscape(g = miic.res, file.path(tempdir(),"/temp"))
##D 
##D # EXAMPLE CANCER
##D data(cosmicCancer)
##D data(cosmicCancer_stateOrder)
##D # execute MIIC (reconstruct graph)
##D miic.res = miic(inputData = cosmicCancer, categoryOrder = cosmicCancer_stateOrder, latent = TRUE,
##D confidenceShuffle = 100, confidenceThreshold = 0.001)
##D 
##D # plot graph
##D miic.plot(miic.res, igraphLayout=igraph::layout_on_grid)
##D 
##D # write graph to graphml format. Note that to correctly visualize
##D # the network we created the miic style for Cytoscape (http://www.cytoscape.org/).
##D miic.write.network.cytoscape(g = miic.res, file = file.path(tempdir(),"/temp"))
##D 
##D # EXAMPLE OHNOLOGS
##D data(ohno)
##D data(ohno_stateOrder)
##D # execute MIIC (reconstruct graph)
##D miic.res = miic(inputData = ohno, latent = TRUE, categoryOrder = ohno_stateOrder,
##D confidenceShuffle = 100, confidenceThreshold = 0.001)
##D 
##D # plot graph
##D miic.plot(miic.res)
##D 
##D # write graph to graphml format. Note that to correctly visualize
##D # the network we created the miic style for Cytoscape (http://www.cytoscape.org/).
##D miic.write.network.cytoscape(g = miic.res, file = file.path(tempdir(),"/temp"))
## End(Not run)



