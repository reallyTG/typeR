library(SEMID)
context("Components related to the tian decomposition.")

source("helperFunctions.R")

test_that("The Tian decomposition recovers covariance matrices correctly.", {
    # Random test
    set.seed(123)
    ps <- c(0.1, 0.05)
    sims <- 10
    ns <- c(10, 20)
    for (p in ps) {
        for (n in ns) {
            for (i in 1:sims) {
                L <- rDirectedAdjMatrix(n, p)
                O <- rUndirectedAdjMat(n, p)
                
                LL <- L * matrix(rnorm(n^2), ncol = n)
                OO <- (O + diag(n)) * matrix(rnorm(n^2), ncol = n)
                OO <- OO + t(OO)
                Sigma <- solve(t(diag(n) - LL)) %*% OO %*% solve(diag(n) - LL)
                
                g <- MixedGraph(L, O)
                cComponents <- g$tianDecompose()
                
                for (comp in cComponents) {
                  internal <- comp$internal
                  incoming <- comp$incoming
                  topOrder <- comp$topOrder
                  
                  LLnew <- LL[topOrder, topOrder, drop = F]
                  LLnew[, topOrder %in% incoming] <- 0
                  OOnew <- OO[topOrder, topOrder, drop = F]
                  OOnew[topOrder %in% incoming, topOrder %in% incoming] <- diag(length(incoming))
                  SigmaNew <- solve(t(diag(length(topOrder)) - LLnew)) %*% OOnew %*% 
                    solve(diag(length(topOrder)) - LLnew)
                  
                  expect_equal(SigmaNew, tianSigmaForComponent(Sigma, internal, incoming, 
                    topOrder))
                }
                
            }
        }
    }
})
