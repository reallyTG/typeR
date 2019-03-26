library(paleotree)


### Name: nodeDates2branchLengths
### Title: Obtaining Edge Lengths for Undated Phylogenies Using Known
###   Branching Node and Tip Ages
### Aliases: nodeDates2branchLengths

### ** Examples

set.seed(444)

# we'll do a number of tests, let's check at the end that all are TRUE
tests <- logical()

# with a non-ultrametric tree
chrono <- rtree(10)
# make an undated tree
notChrono <- chrono
notChrono$edge.length <- NULL

# now lets try with dateNodes in paleotree
nodeTimes <- dateNodes(chrono)
# need to use allTipsModern = FALSE because tip ages are included
chronoRedux <-  nodeDates2branchLengths(tree = notChrono,
    nodeDates = nodeTimes, allTipsModern = FALSE)
# test that its the same
(tests <- c(tests,all.equal.numeric(chrono$edge.length,chronoRedux$edge.length)))

######################################
# modern ultrametric tree
chrono <- rcoal(10)
# make an undated tree
notChrono <- chrono
notChrono$edge.length <- NULL

# with ultrametric trees, you could just use ape's compute.brtime 

# getting branching times with ape
branchingTimes <- branching.times(chrono)	
# setting those branching times with ape
chronoRedux <-  compute.brtime(notChrono, branchingTimes)
# test that its the same
(tests <- c(tests,all.equal.numeric(chrono$edge.length,chronoRedux$edge.length)))

# lets do the same thing but with nodeDates2branchLengths

# can use branching.times from ape 
	# (but only for ultrametric trees!)
chronoRedux <-  nodeDates2branchLengths(tree = notChrono,
    nodeDates = branchingTimes, allTipsModern = TRUE)
# test that its the same
(tests <- c(tests,all.equal.numeric(chrono$edge.length,chronoRedux$edge.length)))

# now lets try with dateNodes in paleotree
nodeTimes <- dateNodes(chrono)
# need to use allTipsModern = FALSE because tip ages are included
chronoRedux <-  nodeDates2branchLengths(tree = notChrono,
    nodeDates = nodeTimes, allTipsModern = FALSE)
# test that its the same
(tests <- c(tests,all.equal.numeric(chrono$edge.length,chronoRedux$edge.length)))

# get just the node times (remove tip dates)
nodeOnlyTimes <- nodeTimes[-(1:Ntip(chrono))]
# let's use the allTipsModern = TRUE setting
chronoRedux <-  nodeDates2branchLengths(tree = notChrono,
    nodeDates = nodeOnlyTimes, allTipsModern = TRUE)
# test that its the same
(tests <- c(tests,all.equal.numeric(chrono$edge.length,chronoRedux$edge.length)))

# did all tests come out as TRUE?
if(!all(tests)){stop("nodeDates2branchLengths isn't functioning correctly")}




