library(FrF2)


### Name: CIG
### Title: Clear interactions graph from catlg entry
### Aliases: CIGstatic CIG gen2CIG
### Keywords: design

### ** Examples

## Not run: 
##D ex.CIG <- CIG("9-4.2")
##D ## play around with the dynamic graph until it looks right
##D ## look up its id number in the title bar of the graph window and use it for id
##D par(xpd=TRUE)
##D CIGstatic(ex.CIG, id=1)
## End(Not run)

graph1 <- CIG("9-4.2", plot=FALSE)   ### create graph object from design name
### calculate graph properties
require(igraph)
degree(graph1)
clique.number(graph1)
independence.number(graph1)
largest.cliques(graph1)

graph2 <- gen2CIG(32, c(7,11,14,29))   ### create graph object from generator columns
### check isomorphism to graph1
graph.isomorphic(graph1,graph2)

## Not run: 
##D ## use a CIG for manual design search
##D ## requirement set: 
##D estim <- compromise(17,15:17)$requirement ## all interactions of factors 15 to 17 (P,Q,R)
##D ## graph the requirement set CIG
##D CIG(estim)
##D FrF2(128, 17, estimable=estim)  ## will run for a very long time
##D ## interrupt with ESC key, after a short period of waiting
##D FrF2.currentlychecked()   ## displays the design that is currently checked 
##D                           ## should be 17-10.2407
##D CIG("17-10.2407")
##D ## clearly, using columns 1, 8 and 9 for factors 15:17 does the job
##D     ## sometimes, the design where the algorithm got stuck, does not provide a solution
##D     ## in that case, option select.catlg can be used for restricting the search designs 
##D     ##     to designs further down in the catalogue, in order to find the next candidate
##D     ##     until final success is reached
##D     ## e.g.
##D     which(names(catlg)=="17-10.2407")
##D     FrF2(128, 17, estimable=estim, select.catlg=catlg[2375:length(catlg)])  
##D     ## will run for a very long time
##D     ## interrupting after short waiting time yields
##D     FrF2.currentlychecked()   ## displays the design that is currently checked 
##D                               ## should be 17-10.4177
##D 
##D ## note: in this example, option sort="high" would make the automatic search fast
##D ## so that manual treatment is not needed!
##D 
## End(Not run)



