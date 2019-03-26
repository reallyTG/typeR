library(bipartite)


### Name: null.distr
### Title: Null model based on fitted marginal distribution
### Aliases: null.distr
### Keywords: package

### ** Examples

## Not run: 
##D data(Safariland)
##D null.distr(N=2, Safariland)
##D null.distr(N=2, Safariland, distr="negbin")
##D 
##D round(networklevel(Safariland, "info"), 3)
##D sapply(null.distr(N=5, Safariland), function(x) networklevel(x, index="info"))
##D # highly connected
##D sapply(null.distr(N=5, Safariland, distr="negbin"), function(x) networklevel(x, 
##D 	index="info")[3])
##D # similarly highly connected
## End(Not run)



