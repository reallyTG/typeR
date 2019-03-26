library(SEMID)
context("Components related to generic identifiability by ancestor decomposition.")

source("helperFunctions.R")

test_that("Ancestral identification does not identify edges erroneously.", {
    # Random test
    set.seed(3634)
    ps <- c(0.3)
    sims <- 10
    ns <- c(5, 6)
    for (p in ps) {
        for (n in ns) {
            for (i in 1:sims) {
                L <- rDirectedAdjMatrix(n, p)
                O <- rUndirectedAdjMat(n, p)
                g <- MixedGraph(L, O)
                gid <- htcID(g)
                aid <- ancestralID(g)
                
                expect_true(all(sapply(1:n, FUN = function(x) {
                  all(gid$solvedParents[[x]] %in% aid$solvedParents[[x]])
                })))
                
                randomIdentificationTest(aid$identifier, L, O, aid$solvedParents)
            }
        }
    }
})

test_that("Old and new ancestralID implementations agree.", {
    # Random test
    set.seed(274)
    ps <- c(0.2, 0.4, 0.6, 0.8)
    sims <- 10
    ns <- c(2, 4, 6)
    for (p in ps) {
        for (n in ns) {
            for (i in 1:sims) {
                L <- rAcyclicDirectedAdjMatrix(n, p)
                O <- rConnectedAdjMatrix(n, p)
                gia <- sort(graphID.ancestralID(L, O))
                aid <- ancestralID(MixedGraph(L, O))
                solvedAid <- setdiff(1:n, which(sapply(aid$unsolvedParents, FUN = function(x) {
                  length(x) != 0
                })))
                randomIdentificationTest(aid$identifier, L, O, aid$solvedParents)
                expect_true(all(gia == solvedAid))
            }
        }
    }
})

test_that("graphID.ancestralID function works as expected.", {
    # Random test
    set.seed(23231)
    ps <- c(0.2, 0.4, 0.6, 0.8)
    sims <- 10
    ns <- c(2, 4, 6)
    for (p in ps) {
        for (n in ns) {
            for (i in 1:sims) {
                L <- rAcyclicDirectedAdjMatrix(n, p)
                O <- rConnectedAdjMatrix(n, p)
                gia <- graphID.ancestralID(L, O)
                gig <- graphID.htcID(L, O)
                gin <- graphID.nonHtcID(L, O)
                expect_true(length(gia) >= length(gig))
                expect_true(all(gig %in% gia))
                expect_true((length(gia) != n) || !gin)
            }
        }
    }
    
    dG <- igraph::graph.edgelist(matrix(c(1, 2, 1, 3, 1, 6, 2, 3, 2, 4, 2, 5, 2, 
        6, 3, 4, 4, 5), ncol = 2, byrow = T))
    bG <- igraph::graph.edgelist(matrix(c(1, 6, 1, 4, 2, 3, 2, 5, 2, 6), ncol = 2, 
        byrow = T), directed = F)
    expect_equal(as.integer(sort(graphID.ancestralID(getAdjMat(dG), getAdjMat(bG)))), 
        1:6)
})

# test_that('getAncestors function works as expected.', { ## Output should be
# empty expect_equal(getAncestors(igraph::graph.empty(), c()), numeric(0))
# expect_equal(getAncestors(igraph::graph.empty(), c(1,2,3)), numeric(0))
# expect_equal(getAncestors(igraph::graph.star(5, mode='in'), c()), numeric(0)) #
# Graph with no edges expect_equal(getAncestors(igraph::graph.empty(5), 1), 1)
# expect_equal(getAncestors(igraph::graph.empty(5), 2), 2)
# expect_equal(getAncestors(igraph::graph.empty(5), c(2,4,5)), c(2,4,5)) # Graphs
# with edges expect_equal(getAncestors(igraph::graph.star(5, mode='in'), 1), 1:5)
# expect_equal(getAncestors(igraph::graph.star(5, mode='in'), 2), 2)
# expect_equal(getAncestors(igraph::graph.star(5, mode='out'), 1), 1)
# expect_equal(getAncestors(igraph::graph.full(5, directed=T), 1), 1:5) g =
# igraph::graph.edgelist(matrix(c(1,2,2,3,3,5,5,7,2,4,4,6,6,7,4,5), ncol=2,
# byrow=T)) expect_equal(getAncestors(g, 1), 1) expect_equal(getAncestors(g, 2),
# c(1,2)) expect_equal(getAncestors(g, 4), c(1,2,4)) expect_equal(getAncestors(g,
# 5), c(1,2,3,4,5)) expect_equal(getAncestors(g, 6), c(1,2,4,6))
# expect_equal(getAncestors(g, c(6, 3)), c(1,2,3,4,6))
# expect_equal(getAncestors(g, 7), 1:7) }) test_that('getParents function works
# as expected.', { ## Output should be empty
# expect_equal(getParents(igraph::graph.empty(), c()), numeric(0))
# expect_equal(getParents(igraph::graph.empty(), c(1,2,3)), numeric(0))
# expect_equal(getParents(igraph::graph.star(5, mode='in'), c()), numeric(0)) #
# Graph with no edges expect_equal(getParents(igraph::graph.empty(5), 1), 1)
# expect_equal(getParents(igraph::graph.empty(5), 2), 2)
# expect_equal(getParents(igraph::graph.empty(5), c(2,4,5)), c(2,4,5)) # Graphs
# with edges expect_equal(getParents(igraph::graph.star(5, mode='in'), 1), 1:5)
# expect_equal(getParents(igraph::graph.star(5, mode='in'), 2), 2)
# expect_equal(getParents(igraph::graph.star(5, mode='out'), 1), 1)
# expect_equal(getParents(igraph::graph.full(5, directed=T), 1), 1:5) g =
# igraph::graph.edgelist(matrix(c(1,2,2,3,3,5,5,7,2,4,4,6,6,7,4,5,1,7), ncol=2,
# byrow=T)) expect_equal(getParents(g, 1), 1) expect_equal(getParents(g, 2),
# c(1,2)) expect_equal(getParents(g, 4), c(2,4)) expect_equal(getParents(g, 5),
# c(3,4,5)) expect_equal(getParents(g, 6), c(4,6)) expect_equal(getParents(g,
# c(6, 3)), c(2,3,4,6)) expect_equal(getParents(g, 7), c(1,5,6,7)) })
# test_that('getSiblings function works as expected.', { ## Output should be
# empty expect_equal(getSiblings(igraph::graph.empty(), c()), numeric(0))
# expect_equal(getSiblings(igraph::graph.empty(), c(1,2,3)), numeric(0))
# expect_equal(getSiblings(igraph::graph.star(5, mode='in'), c()), numeric(0)) #
# Graph with no edges expect_equal(getSiblings(igraph::graph.empty(5), 1), 1)
# expect_equal(getSiblings(igraph::graph.empty(5), 2), 2)
# expect_equal(getSiblings(igraph::graph.empty(5), c(2,4,5)), c(2,4,5)) # Graphs
# with edges expect_equal(getSiblings(igraph::graph.star(5, mode='in'), 1), 1:5)
# expect_equal(getSiblings(igraph::graph.star(5, mode='in'), 2), c(1,2))
# expect_equal(getSiblings(igraph::graph.star(5, mode='out'), 1), 1:5)
# expect_equal(getSiblings(igraph::graph.star(5, mode = 'undirected'), 1), 1:5)
# expect_equal(getSiblings(igraph::graph.full(5, directed=F), 1), 1:5) g =
# igraph::graph.edgelist(matrix(c(1,2,2,3,3,5,5,7,2,4,4,6,6,7,4,5,1,7), ncol=2,
# byrow=T), directed = F) expect_equal(getSiblings(g, 1), c(1,2,7))
# expect_equal(getSiblings(g, 2), c(1,2,3,4)) expect_equal(getSiblings(g, c(6,
# 3)), c(2,3,4,5,6,7)) }) test_that('getMixedCompForNode function works as
# expected.', { ## Graph with single node dG = igraph::graph.empty(1, directed=T)
# bG = igraph::graph.empty(1, directed=F) expect_error(getMixedCompForNode(dG,
# bG, 1, 1)) # Since vertices are unnamed V(dG)$names = 1 V(bG)$names = 1
# compList = getMixedCompForNode(dG, bG, 1, 1) expect_equal(compList,
# list(biNodes=1, inNodes=numeric(0))) expect_error(getMixedCompForNode(dG, bG,
# 1, 2)) expect_error(getMixedCompForNode(dG, bG, 2, 1)) # Graph with 2 nodes dG
# = igraph::graph.empty(2, directed=T) bG = igraph::graph.empty(2, directed=F)
# V(dG)$names = 1:2 V(bG)$names = 2:1 expect_error(getMixedCompForNode(dG, bG, 1,
# 1)) # Since vertices are wrongly named V(dG)$names = 1:2 V(bG)$names = 1:2
# compList = getMixedCompForNode(dG, bG, 1, 1) expect_equal(compList,
# list(biNodes=1, inNodes=numeric(0))) compList = getMixedCompForNode(dG, bG, 1,
# 2) expect_equal(compList, list(biNodes=numeric(0), inNodes=numeric(0)))
# compList = getMixedCompForNode(dG, bG, 2, 1) expect_equal(compList,
# list(biNodes=numeric(0), inNodes=numeric(0))) # The sink marginalization
# example dG = igraph::graph.edgelist(matrix(c(1,2, 1,3, 1,6, 2,3, 2,4, 2,5, 2,6,
# 3,4, 4,5), ncol=2, byrow=T)) bG = igraph::graph.edgelist(matrix(c(1,6, 1,4,
# 2,3, 2,5, 2,6), ncol=2, byrow=T), directed=F) V(dG)$names = 1:6 V(bG)$names =
# 1:6 compList = getMixedCompForNode(dG, bG, 1:6, 1) expect_equal(compList,
# list(biNodes=1:6, inNodes=numeric(0))) compList = getMixedCompForNode(dG, bG,
# c(4,5), 5) expect_equal(compList, list(biNodes=5, inNodes=4)) compList =
# getMixedCompForNode(dG, bG, 1:5, 5) expect_equal(compList,
# list(biNodes=c(2,3,5), inNodes=c(1,4))) compList = getMixedCompForNode(dG, bG,
# c(2,3,4), 4) expect_equal(compList, list(biNodes=c(4), inNodes=c(2,3)))
# compList = getMixedCompForNode(dG, bG, rev(c(2,4,5,6)), 2)
# expect_equal(compList, list(biNodes=c(2,5,6), inNodes=c(4))) bG =
# delete.edges(bG, get.edge.ids(bG, c(1,6))) compList = getMixedCompForNode(dG,
# bG, 1:6, 1) expect_equal(compList, list(biNodes=c(1,4), inNodes=c(2,3)))
# compList = getMixedCompForNode(dG, bG, 1:6, 3) expect_equal(compList,
# list(biNodes=c(2,3,5,6), inNodes=c(1,4))) }) test_that('getMaxFlow function
# works as expected.', { ## Graph with single node dG = igraph::graph.empty(1,
# directed=T) bG = igraph::graph.empty(1, directed=F)
# expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(), c(1), numeric(0),
# 1), 0) ## Graph with two disconnected nodes dG = igraph::graph.empty(2,
# directed=T) bG = igraph::graph.empty(2, directed=F)
# expect_error(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(1), c(1), numeric(0),
# 1)) expect_error(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(2), c(2),
# numeric(0), 2)) expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(2),
# c(1), numeric(0), 1), 0) expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG),
# c(), c(2), numeric(0), 2), 0) expect_equal(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(), c(1), numeric(0), 1), 0)
# expect_error(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(), c(1), numeric(0),
# 2)) ## Two connected nodes dG = igraph::graph.edgelist(t(c(1,2)), directed=T)
# bG = igraph::graph.empty(2, directed=F) expect_equal(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(), c(2), numeric(0), 2), 0)
# expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(1), c(2), numeric(0),
# 2), 0) expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(1), c(2), c(1),
# 2), 1) bG = add.edges(bG, c(1,2)) expect_error(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(), c(2), c(1), 2)) expect_error(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(1), c(1,2), c(), 2)) expect_error(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(2), c(2), c(), 2)) expect_equal(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(), c(2), c(), 2), 0) dG = add.edges(add.vertices(dG, 1),
# c(3,1)) bG = add.vertices(bG, 1) expect_equal(getMaxFlow(getAdjMat(dG),
# getAdjMat(bG), c(3), c(1,2), c(3), 2), 1)
# expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(3), c(1,2), c(3), 1),
# 1) expect_equal(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(3), c(1), c(3), 1),
# 1) expect_error(getMaxFlow(getAdjMat(dG), getAdjMat(bG), c(3), c(2,3), c(1),
# 2)) ## The sink marginalization example dG =
# igraph::graph.edgelist(matrix(c(1,2, 1,3, 1,6, 2,3, 2,4, 2,5, 2,6, 3,4, 4,5),
# ncol=2, byrow=T)) bG = igraph::graph.edgelist(matrix(c(1,6, 1,4, 2,3, 2,5,
# 2,6), ncol=2, byrow=T), directed=F) L = getAdjMat(dG) O = getAdjMat(bG)
# expect_equal(getMaxFlow(L, O, allowedNodes=c(1,3), biNodes=1:6, inNodes=c(),
# node=5), 2) expect_equal(getMaxFlow(L, O, allowedNodes=c(1), biNodes=1:6,
# inNodes=c(), node=5), 1) expect_equal(getMaxFlow(L, O, allowedNodes=c(6),
# biNodes=1:6, inNodes=c(), node=5), 1) L1 = L; L1[1,3] = 0 O1 = O; O1[2,c(3,5)]
# = 0; O1[c(3,5), 2] = 0 expect_equal(getMaxFlow(L1, O1, allowedNodes=c(2,6),
# biNodes=1:6, inNodes=c(), node=5), 1) })

