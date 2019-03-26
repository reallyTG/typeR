library(netdiffuseR)


### Name: rgraph_er
### Title: Erdos-Renyi model
### Aliases: rgraph_er bernoulli
### Keywords: distribution

### ** Examples

## Not run: 
##D # Setting the seed
##D set.seed(123)
##D 
##D # Generating an directed graph
##D rgraph_er(undirected=FALSE)
##D 
##D # Comparing P(tie)
##D x <- rgraph_er(1000, p=.1)
##D sum(x)/length(x)
##D 
##D # Several period random gram
##D rgraph_er(t=5)
## End(Not run)



