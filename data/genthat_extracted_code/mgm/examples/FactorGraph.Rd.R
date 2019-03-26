library(mgm)


### Name: FactorGraph
### Title: Draws a factor graph of a (time-varying) MGM
### Aliases: FactorGraph

### ** Examples



## Not run: 
##D 
##D # Fit MGM with pairwise & threeway interactions to Autism Dataset
##D fit_k3 <- mgm(data = autism_data$data,
##D               type = autism_data$type,
##D               level = autism_data$lev,
##D               k = 3, 
##D               overparameterize = TRUE,
##D               lambdaSel = "EBIC", 
##D               lambdaGam = .5) 
##D 
##D # List of estimated interactions
##D fit_k3$interactions$indicator
##D 
##D # Plot Factor Graph 
##D nodeColors <- c("white", "orange", "lightblue")
##D 
##D FactorGraph(object = fit_k3, 
##D             PairwiseAsEdge = FALSE, 
##D             DoNotPlot = FALSE, 
##D             colors = nodeColors, 
##D             labels = 1:7, 
##D             layout="spring")
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
## End(Not run)




