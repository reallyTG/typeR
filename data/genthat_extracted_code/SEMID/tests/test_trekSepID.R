library(SEMID)
context("Components related to trek separation identification.")

source("helperFunctions.R")

trekSepId <- function(mixedGraph, maxTrekSepSubsetSize = 3) {
    tsIdStep <- function(mixedGraph, unsolvedParents, solvedParents, identifier) {
        return(trekSeparationIdentifyStep(mixedGraph, unsolvedParents, solvedParents, 
            identifier, maxSubsetSize = maxTrekSepSubsetSize))
    }
    return(generalGenericID(mixedGraph, list(tsIdStep)))
}

test_that("Edgewise identification does not identify edges erroneously.", {
    # Random test
    set.seed(1231)
    ps <- c(0.3)
    sims <- 20
    ns <- c(4, 5)
    for (p in ps) {
        for (n in ns) {
            for (i in 1:sims) {
                L <- rDirectedAdjMatrix(n, p)
                O <- rUndirectedAdjMat(n, p)
                tsid <- trekSepId(MixedGraph(L, O))
                
                randomIdentificationTest(tsid$identifier, L, O, tsid$solvedParents)
            }
        }
    }
})
