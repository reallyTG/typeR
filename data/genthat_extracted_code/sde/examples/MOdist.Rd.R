library(sde)


### Name: MOdist
### Title: Markov Operator distance for clustering diffusion processes.
### Aliases: MOdist
### Keywords: datagen ts

### ** Examples

## Not run: 
##D data(quotes)
##D 
##D plot(quotes)
##D 
##D d <- MOdist(quotes)
##D cl <- hclust( d )
##D groups <- cutree(cl, k=4)
##D 
##D cmd <- cmdscale(d)
##D plot( cmd, col=groups)
##D text( cmd, labels(d) , col=groups)
##D 
##D plot(quotes, col=groups)
##D 
##D plot(quotes, col=groups,ylim=range(quotes))
## End(Not run)



