library(aqp)


### Name: hzTransitionProbabilities
### Title: Horizon Transition Probabilities
### Aliases: hzTransitionProbabilities genhzTableToAdjMat
###   mostLikelyHzSequence
### Keywords: manip

### ** Examples

data(sp4)
depths(sp4) <- id ~ top + bottom

# horizon transition probabilities: row -> col transitions
(tp <- hzTransitionProbabilities(sp4, 'name'))


## Not run: 
##D ## plot TP matrix with functions from sharpshootR package
##D library(sharpshootR)
##D par(mar=c(0,0,0,0), mfcol=c(1,2))
##D plot(sp4)
##D plotSoilRelationGraph(tp, graph.mode = 'directed', edge.arrow.size=0.5)
##D 
##D ## demonstrate genhzTableToAdjMat usage
##D data(loafercreek, package='soilDB')
##D 
##D # convert contingency table -> adj matrix / TP matrix
##D tab <- table(loafercreek$hzname, loafercreek$genhz)
##D m <- genhzTableToAdjMat(tab)
##D 
##D # plot 
##D par(mar=c(0,0,0,0), mfcol=c(1,1))
##D plotSoilRelationGraph(m, graph.mode = 'directed', edge.arrow.size=0.5)
##D 
##D 
##D ## demonstrate markovchain integration
##D library(markovchain)
##D tp.loops <- hzTransitionProbabilities(sp4, 'name', loopTerminalStates = TRUE)
##D 
##D # init new markovchain from TP matrix
##D mc <- new("markovchain", states=dimnames(tp.loops)[[1]], transitionMatrix = tp.loops)
##D 
##D # simple plot
##D plot(mc, edge.arrow.size=0.5)
##D 
##D # check absorbing states
##D absorbingStates(mc)
##D 
##D # steady-state:
##D steadyStates(mc)
## End(Not run)



