library(RSiena)


### Name: sienaGOF-auxiliary
### Title: Auxiliary functions for goodness of fit assessment by 'sienaGOF'
### Aliases: sienaGOF-auxiliary sparseMatrixExtraction networkExtraction
###   behaviorExtraction OutdegreeDistribution IndegreeDistribution
###   BehaviorDistribution TriadCensus mixedTriadCensus
### Keywords: models

### ** Examples

### For use out of the box:

mynet1 <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
mybeh <- sienaDependent(s50a[,1:2], type="behavior")
mydata <- sienaDataCreate(mynet1, mybeh)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTies, cycle3)
# Shorter phases 2 and 3, just for example:
myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=50, seed=1234)
(ans <- siena07(myalgorithm, data=mydata, effects=myeff, returnDeps=TRUE,
   batch=TRUE))

OutdegreeDistribution(NULL, ans$f, ans$sims, period=1, groupName="Data1",
  levls=0:7, varName="mynet1")
IndegreeDistribution(5, ans$f, ans$sims, period=1, groupName="Data1",
  varName="mynet1")
BehaviorDistribution(20, ans$f, ans$sims, period=1, groupName="Data1",
  varName="mybeh")
sparseMatrixExtraction(50, ans$f, ans$sims, period=1, groupName="Data1",
  varName="mynet1")
networkExtraction(40, ans$f, ans$sims, period=1, groupName="Data1",
  varName="mynet1")
behaviorExtraction(50, ans$f, ans$sims, period=1, groupName="Data1",
  varName="mybeh")

gofi <- sienaGOF(ans, IndegreeDistribution, verbose=TRUE, join=TRUE,
  varName="mynet1")
gofi
plot(gofi)

(gofo <- sienaGOF(ans, OutdegreeDistribution, verbose=TRUE, join=TRUE,
    varName="mynet1", cumulative=FALSE))
# cumulative is an example of "...".
plot(gofo)

(gofb <- sienaGOF(ans, BehaviorDistribution, varName = "mybeh",
    verbose=TRUE, join=TRUE, cumulative=FALSE))
plot(gofb)

(goftc <- sienaGOF(ans, TriadCensus, verbose=TRUE, join=TRUE,
    varName="mynet1"))
plot(goftc, center=TRUE, scale=TRUE)
# For this type of auxiliary statistics
# it is advisable in the plot to center and scale.
# note the keys at the x-axis.
descriptives.sienaGOF(goftc)
round(descriptives.sienaGOF(goftc, center=TRUE, scale=TRUE), 0)

## Not run: 
##D ### The mixed triad census for co-evolution of one-mode and two-mode networks:
##D actors <- sienaNodeSet(50, nodeSetName="actors")
##D activities <- sienaNodeSet(20, nodeSetName="activities")
##D onemodenet <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)),
##D                             nodeSet="actors")
##D twomodenet <- sienaDependent(array(c(s502[1:50, 1:20], s503[1:50, 1:20]),
##D                                                         dim=c(50, 20, 2)),
##D                             type= "bipartite", nodeSet=c("actors", "activities"))
##D twodata <- sienaDataCreate(onemodenet, twomodenet,
##D                         nodeSets=list(actors, activities))
##D twoeff <- getEffects(twodata)
##D twoeff <- includeEffects(twoeff, outActIntn, name="onemodenet",
##D                             interaction1="twomodenet")
##D twoeff <- includeEffects(twoeff, outActIntn, name="twomodenet",
##D                             interaction1="onemodenet")
##D twoeff <- includeEffects(twoeff, from, name="onemodenet",
##D                             interaction1="twomodenet")
##D twoeff <- includeEffects(twoeff, to, name="twomodenet",
##D                             interaction1="onemodenet")
##D twoeff
##D # Shorter phases 2 and 3, just for example:
##D twoalgorithm <- sienaAlgorithmCreate(projname="twomode", nsub=2, n3=200, seed=1234)
##D (ans <- siena07(twoalgorithm, data=twodata, effects=twoeff, returnDeps=TRUE,
##D    batch=TRUE))
##D (gof.two <- sienaGOF(ans, mixedTriadCensus,
##D                         varName=c("onemodenet", "twomodenet"), verbose=TRUE))
##D plot(gof.two, center=TRUE, scale=TRUE)
## End(Not run)

## Not run: 
##D ### Here come some useful functions for building your own auxiliary statistics:
##D ### First an extraction function.
##D 
##D # igraphNetworkExtraction extracts simulated and observed networks
##D # from the results of a siena07 run.
##D # It returns the network as an edge list of class "graph"
##D # according to the igraph package.
##D # Ties for ordered pairs with a missing value for wave=period or period+1
##D # are zeroed;
##D # note that this also is done in RSiena for calculation of target statistics.
##D # However, changing structurally fixed values are not taken into account.
##D igraphNetworkExtraction <- function(i, data, sims, period, groupName, varName) {
##D   require(igraph)
##D   dimsOfDepVar<- attr(data[[groupName]]$depvars[[varName]], "netdims")
##D   missings <- is.na(data[[groupName]]$depvars[[varName]][,,period]) |
##D     is.na(data[[groupName]]$depvars[[varName]][,,period+1])
##D   if (is.null(i)) {
##D     # sienaGOF wants the observation:
##D     original <- data[[groupName]]$depvars[[varName]][,,period+1]
##D     original[missings] <- 0
##D     returnValue <- graph.adjacency(original)
##D   }
##D   else
##D   {
##D     missings <- graph.adjacency(missings)
##D     #sienaGOF wants the i-th simulation:
##D     returnValue <- graph.difference(
##D       graph.empty(dimsOfDepVar) +
##D         edges(t(sims[[i]][[groupName]][[varName]][[period]][,1:2])),
##D       missings)
##D   }
##D   returnValue
##D }
##D 
##D ### Then some auxiliary statistics.
##D 
##D # GeodesicDistribution calculates the distribution of non-directed
##D # geodesic distances; see ?sna::geodist
##D # The default for \code{levls} reflects that geodesic distances larger than 5
##D # do not differ appreciably with respect to interpretation.
##D # Note that the levels of the result are named;
##D # these names are used in the \code{plot} method.
##D GeodesicDistribution <- function (i, data, sims, period, groupName,
##D   varName, levls=c(1:5,Inf), cumulative=TRUE, ...) {
##D   x <- networkExtraction(i, data, sims, period, groupName, varName)
##D   require(network)
##D   require(sna)
##D   a <- sna::geodist(symmetrize(x))$gdist
##D   if (cumulative)
##D   {
##D     gdi <- sapply(levls, function(i){ sum(a<=i) })
##D   }
##D   else
##D   {
##D     gdi <- sapply(levls, function(i){ sum(a==i) })
##D   }
##D   names(gdi) <- as.character(levls)
##D   gdi
##D }
##D 
##D # Holland and Leinhardt Triad Census from sna; see ?sna::triad.census.
##D # For undirected networks, call this with levls=1:4
##D TriadCensus.sna <- function(i, data, sims, period, groupName, varName, levls=1:16){
##D   unloadNamespace("igraph") # to avoid package clashes
##D   require(network)
##D   require(sna)
##D   x <- networkExtraction(i, data, sims, period, groupName, varName)
##D   if (network.edgecount(x) <= 0){x <- symmetrize(x)}
##D   # because else triad.census(x) will lead to an error
##D   tc <- sna::triad.census(x)[levls]
##D   # names are transferred automatically
##D   tc
##D }
##D 
##D # Holland and Leinhardt Triad Census from igraph; see ?igraph::triad_census.
##D TriadCensus.i <- function(i, data, sims, period, groupName, varName){
##D   unloadNamespace("sna") # to avoid package clashes
##D   require(igraph)
##D   x <- igraphNetworkExtraction(i, data, sims, period, groupName, varName)
##D # suppressWarnings is used because else warnings will be generated
##D # when a generated network happens to be symmetric.
##D   setNames(suppressWarnings(triad_census(x)),
##D             c("003", "012", "102", "021D","021U", "021C", "111D", "111U",
##D             "030T", "030C", "201",  "120D", "120U", "120C", "210", "300"))
##D }
##D 
##D # CliqueCensus calculates the distribution of the clique census
##D # of the symmetrized network; see ?sna::clique.census.
##D CliqueCensus<-function (i, obsData, sims, period, groupName, varName, levls = 1:5){
##D   require(sna)
##D   x <- networkExtraction(i, obsData, sims, period, groupName, varName)
##D   cc0 <- sna::clique.census(x, mode='graph', tabulate.by.vertex = FALSE,
##D     enumerate=FALSE)[[1]]
##D   cc <- 0*levls
##D   names(cc) <- as.character(levls)
##D   levels.used <- as.numeric(intersect(names(cc0), names(cc)))
##D   cc[levels.used] <- cc0[levels.used]
##D   cc
##D }
##D 
##D # Distribution of Bonacich eigenvalue centrality; see ?igraph::evcent.
##D EigenvalueDistribution <- function (i, data, sims, period, groupName, varName,
##D   levls=c(seq(0,1,by=0.125)), cumulative=TRUE){
##D   require(igraph)
##D   x <- igraphNetworkExtraction(i, data, sims, period, groupName, varName)
##D   a <- igraph::evcent(x)$vector
##D   a[is.na(a)] <- Inf
##D   lel <- length(levls)
##D   if (cumulative)
##D   {
##D     cdi <- sapply(2:lel, function(i){sum(a<=levls[i])})
##D   }
##D   else
##D   {
##D     cdi <- sapply(2:lel, function(i){
##D       sum(a<=levls[i]) - sum(a <= levls[i-1])})
##D   }
##D   names(cdi) <- as.character(levls[2:lel])
##D   cdi
##D }
##D 
##D ## Finally some examples of the three auxiliary statistics constructed above.
##D mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
##D mybeh <- sienaDependent(s50a, type="behavior")
##D mydata <- sienaDataCreate(mynet1, mybeh)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip, cycle3, nbrDist2)
##D myeff <- includeEffects(myeff, outdeg, name="mybeh", interaction1="mynet1")
##D myeff <- includeEffects(myeff,  outdeg, name="mybeh", interaction1="mynet1")
##D # Shorter phases 2 and 3, just for example:
##D myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=200, seed=1234)
##D (ans2 <- siena07(myalgorithm, data=mydata, effects=myeff, returnDeps=TRUE,
##D    batch=TRUE))
##D gofc <- sienaGOF(ans2, EigenvalueDistribution, varName="mynet1",
##D   verbose=TRUE, join=TRUE)
##D plot(gofc)
##D descriptives.sienaGOF(gofc, showAll=TRUE)
##D 
##D goftc <- sienaGOF(ans2, TriadCensus, varName="mynet1", verbose=TRUE, join=TRUE)
##D plot(goftc, center=TRUE, scale=TRUE)
##D # For this type of auxiliary statistics
##D # it is advisable in the plot to center and scale.
##D # note the keys at the x-axis; these names are given by sna::triad.census
##D descriptives.sienaGOF(goftc)
##D round(descriptives.sienaGOF(goftc))
##D 
##D gofgd <- sienaGOF(ans2, GeodesicDistribution, varName="mynet1",
##D   verbose=TRUE, join=TRUE, cumulative=FALSE)
##D plot(gofgd)
##D # and without infinite distances:
##D gofgdd <- sienaGOF(ans2, GeodesicDistribution, varName="mynet1",
##D   verbose=TRUE, join=TRUE, levls=1:7, cumulative=FALSE)
##D plot(gofgdd)
## End(Not run)



