library(btergm)


### Name: gofstatistics
### Title: Statistics for goodness-of-fit assessment of network models
### Aliases: gofstatistics gof-statistics statistics gofterms gof-terms
###   comemb dsp esp nsp deg ideg odeg b1deg b2deg istar kstar ostar b1star
###   b2star kcycle geodesic triad.directed triad.undirected pr roc rocpr
###   rocprgof edgebetweenness.modularity edgebetweenness.pr
###   edgebetweenness.roc fastgreedy.modularity fastgreedy.pr
###   fastgreedy.roc louvain.modularity louvain.pr louvain.roc
###   maxmod.modularity maxmod.pr maxmod.roc spinglass.modularity
###   spinglass.pr spinglass.roc walktrap.modularity walktrap.pr
###   walktrap.roc
### Keywords: statistics gof

### ** Examples

# To see how these statistics are used, look at the examples section of 
# ?"gof-methods". The following example illustrates how custom 
# statistics can be created. Suppose one is interested in the density 
# of a network. Then a univariate statistic can be created as follows.

dens <- function(mat, ...) {        # univariate: one argument
  mat <- as.matrix(mat)             # sparse matrix -> normal matrix
  d <- sna::gden(mat)               # compute the actual statistic
  attributes(d)$label <- "Density"  # add a descriptive label
  return(d)                         # return the statistic
}

# Note that the '...' argument must be present in all statistics. 
# Now the statistic can be used in the statistics argument of one of 
# the gof methods.

# For illustrative purposes, let us consider an existing statistic, the 
# indegree distribution, a multivariate statistic. It also accepts a 
# single argument. Note that the sparse matrix is converted to a 
# normal matrix object when it is used. First, statnet's summary 
# method is used to compute the statistic. Names are attached to the 
# resulting vector for the different indegree values. Then the vector 
# is returned.

ideg <- function(mat, ...) {
  d <- summary(mat ~ idegree(0:(nrow(mat) - 1)))
  names(d) <- 0:(length(d) - 1)
  attributes(d)$label <- "Indegree"
  return(d)
}

# See the gofstatistics.R file in the package for more complex examples.



