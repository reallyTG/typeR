library(qgraph)


### Name: ggmModSelect
### Title: Unregularized GGM model search
### Aliases: ggmModSelect

### ** Examples

## Not run: 
##D # Load data:
##D library("psych")
##D data(bfi)
##D 
##D # Compute polychoric correlations:
##D corMat <- cor_auto(bfi[,1:25])
##D 
##D # Optimize network:
##D Results <- ggmModSelect(corMat, nrow(bfi), gamma = 0.5, nCores = 8)
##D 
##D # Plot results:
##D qgraph(Results$graph, layout = "spring", cut = 0)
## End(Not run)



