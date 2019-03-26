library(miniCRAN)


### Name: makeDepGraph
### Title: Create dependency graph from available packages.
### Aliases: makeDepGraph

### ** Examples




availPkgs <- cranJuly2014

## Not run: 
##D availPkgs <- pkgAvail(
##D   repos = c(CRAN = getOption("minicran.mran")),
##D   type = "source"
##D   )
## End(Not run)


# Create dependency graph using stored database of available packages
p <- makeDepGraph(
  c("ggplot2", "forecast"),
  availPkgs = availPkgs
)

if(require(igraph)) plot(p)



## Not run: 
##D   # Create dependency graph using newly retrieved database from CRAN
##D 
##D   p <- makeDepGraph(
##D   c("ggplot2", "forecast"),
##D   repos = c(CRAN = getOption("minicran.mran")),
##D   type = "source"
##D )
##D if(require(igraph)) plot(p)
## End(Not run)



