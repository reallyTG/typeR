library(epoc)


### Name: EPoC
### Title: EPoC
### Aliases: epoc epocA epocG summary.EPOCA summary.EPOCG predict.EPOCA
###   predict.EPOCG print.EPOCA print.EPOCG coef.EPOCA coef.EPOCG
###   epoc.lambdamax write.sif as.graph.EPOCA as.graph.EPOCG
### Keywords: cancer selection multivariate models graphs

### ** Examples

## Not run: 
##D modelA <- epocA(X,U)
##D modelG <- epocG(X,U)
##D 
##D # plot sparsest A and G models using the igraph package
##D # arrows only tell direction, not inhibit or stimulate
##D par(mfrow=c(1,2))
##D plot(modelA)
##D plot(modelG)
##D 
##D # OpenGL 3D plot on sphere using the igraph and rgl packages
##D plot(modelA,threed=T)
##D 
##D # Write the graph to a file in SIF format for import in e.g. Cytoscape
##D write.sif(modelA,file="modelA.sif")
##D 
##D # plot graph in Cytoscape using Cytoscape XMLRPC plugin and 
##D # R packages RCytoscape, bioconductor graph, XMLRPC
##D require('graph')
##D require('RCytoscape')
##D g <- as.graph.EPOCA(modelA,k=5)
##D cw <- CytoscapeWindow("EPoC", graph = g)
##D displayGraph(cw)
##D 
##D # prediction
##D N <- dim(X)[1]
##D ii <- sample(1:N, N/3)
##D 
##D modelG <- epocG(X[ii,], U[ii,])
##D K <- length(modelA$lambda) # densest model index index
##D newdata <- list(U=U[-ii,])
##D e <- X[-ii,] - predict(modelA, newdata, k=K)
##D RSS <- sum(e^2)
##D cat("RMSD:", sqrt(RSS/N), "\n")
##D 
## End(Not run)



