library(cba)


### Name: rockCluster
### Title: Rock Clustering
### Aliases: rockCluster rockLink
### Keywords: cluster

### ** Examples

### example from paper
data(Votes)
x <- as.dummy(Votes[-17])
rc <- rockCluster(x, n=2, theta=0.73, debug=TRUE)
print(rc)
rf <- fitted(rc)
table(Votes$Class, rf$cl)
## Not run: 
##D ### large example from paper
##D data("Mushroom")
##D x <- as.dummy(Mushroom[-1])
##D rc <- rockCluster(x[sample(dim(x)[1],1000),], n=10, theta=0.8)
##D print(rc)
##D rp <- predict(rc, x)
##D table(Mushroom$class, rp$cl)
## End(Not run)
### real valued example
gdist <- function(x, y=NULL) 1-exp(-dist(x, y)^2)
xr <- matrix(rnorm(200, sd=0.6)+rep(rep(c(1,-1),each=50),2), ncol=2)
rcr <- rockCluster(xr, n=2, theta=0.75, fun=gdist, funArgs=NULL)
print(rcr)



