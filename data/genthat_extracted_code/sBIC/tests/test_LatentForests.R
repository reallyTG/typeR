library(sBIC)
library(mvtnorm)

context("Testing LatentForests")

# TODO: More tests!

test_that("getCovMatrix works", {
  expect_equal(LatentForests(1)$getCovMat(numeric(0)), matrix(1))

  expect_equal(LatentForests(2, c(1,2))$getCovMat(rep(.1, 1)),
               matrix(c(1.00, 00.1,
                        00.1, 1.00), ncol = 2))

  expect_equal(LatentForests(3, c(4,1,4,2,4,3))$getCovMat(c(.1, .2, .3)),
               matrix(c(1.00, 0.02, 0.03, 00.1,
                        0.02, 1.00, 0.06, 00.2,
                        0.03, 0.06, 1.00, 00.3,
                        00.1, 00.2, 00.3, 1.00), ncol = 4))

  expect_equal(LatentForests(4, c(5,1, 5,2, 5,6, 6,3, 6,4))$getCovMat(c(.1, .2, 0, .1, .2)),
               matrix(c(1.00, 0.02, 0.00, 00.0, 00.1, 00.0,
                        0.02, 1.00, 0.00, 0.00, 00.2, 00.0,
                        0.00, 0.00, 1.00, 0.02, 00.0, 00.1,
                        0.00, 0.00, 0.02, 1.00, 0.00, 00.2,
                        0.10, 0.20, 0.00, 0.00, 1.00, 0.00,
                        0.00, 0.00, 00.1, 00.2, 0.00, 1.00), ncol = 6))
})

test_that("LatentForests logLike works", {
  randomCorMat = function(n) {
    corMat = matrix(numeric(n ^ 2), ncol = n)
    for (i in 1:n) {
      x = runif(n)
      corMat = corMat + matrix(x) %*% x
    }
    return(sqrt(solve(diag(diag(corMat)))) %*% corMat %*% sqrt(solve(diag(diag(corMat)))))
  }

  set.seed(89842)
  numLeaves = 10
  numSamples = 100

  for (i in 1:10) {
    corMat = randomCorMat(numLeaves)
    X = rmvnorm(100, sigma = corMat)
    lfs = LatentForests(numLeaves)
    lfs$setData(X)
    a = lfs$logLike(corMat)
    b = sum(dmvnorm(X, sigma = corMat, log = T))
    expect_equal(a, b)
  }
})

test_that("Randomized testing of the EM algorithm", {
  respectsZeros = function(forest, covMat) {
    numLeaves = ncol(covMat)
    if (numLeaves == 1) {
      return(T)
    }
    isDisconnected = (igraph::distances(forest) == Inf)[1:numLeaves, 1:numLeaves]
    for (i in 1:(numLeaves - 1)) {
      for (j in (i + 1):numLeaves) {
        if (isDisconnected[i, j] && covMat[i, j] != 0) {
          return(F)
        }
      }
    }
    return(T)
  }

  for (i in 1:100) {
    set.seed(323231 + i)
    numLeaves = sample(1:7, 1)
    g = generateRandomBinaryForest(numLeaves, sample(0:(numLeaves - 1), 1))
    edgeList = igraph::get.edgelist(g)
    lfs = LatentForests(numLeaves, edgeList)

    trueModel = sample(1:(lfs$getNumModels()), 1)
    support = lfs$getSupport(trueModel)
    edgeCorrs = support * runif(length(support), 0, 1)

    corMat = lfs$getCovMat(edgeCorrs)

    n = 10000
    X = rmvnorm(n, sigma = corMat[1:numLeaves, 1:numLeaves, drop = F])
    lfs$setData(X)

    emResults = lfs$emMain(trueModel)
    emSigma = emResults$covMat

    A = emSigma[1:numLeaves, 1:numLeaves, drop = F]
    B = corMat[1:numLeaves, 1:numLeaves, drop = F]

    respectsZeros(g, emSigma)

    a = lfs$logLike(A)
    b = lfs$logLike(B)
    expect_true(abs(b - a) / abs(a) < 10^-3)
  }
})

test_that("Learning coefficients are correct", {
  edgeList = matrix(c(1, 6, 2, 6, 6, 7, 7, 8, 3, 7, 4, 8, 5, 8),
                    ncol = 2,
                    byrow = T)
  numLeaves = 5
  lfs = LatentForests(numLeaves, edgeList)

  support = rep(1, 7)
  subSupport = rep(1, 7)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 6)
  expect_equal(lf$m, 1)

  support = c(0, 0, 0, 0, 0, 0, 0)
  subSupport = c(0, 0, 0, 0, 0, 0, 0)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 2.5)
  expect_equal(lf$m, 1)

  support = rep(1, 7)
  subSupport = c(0, 0, 0, 1, 1, 1, 1)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 4.75)
  expect_equal(lf$m, 1)

  support = rep(1, 7)
  subSupport = c(1, 0, 1, 1, 0, 0, 1)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 4.5)
  expect_equal(lf$m, 1)

  support = c(1, 0, 1, 1, 0, 0, 1)
  subSupport = c(0, 0, 0, 0, 0, 0, 0)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 3)
  expect_equal(lf$m, 4)

  support = c(1, 1, 0, 1, 1, 1, 0)
  subSupport = c(1, 1, 0, 0, 0, 0, 0)
  lf = lfs$learnCoef(lfs$getModelWithSupport(support), lfs$getModelWithSupport(subSupport))
  expect_equal(lf$lambda, 3.5)
  expect_equal(lf$m, 3)

  edgeList = matrix(numeric(0), ncol = 2, byrow = T)
  numLeaves = 0
  lfs = LatentForests(numLeaves, edgeList)
  lf = lfs$learnCoef(lfs$getModelWithSupport(numeric(0)), lfs$getModelWithSupport(numeric(0)))
  expect_equal(lf$lambda, 0)
  expect_equal(lf$m, 1)

  # second part
  edgeList = matrix(c(1, 6, 2, 6, 6, 7, 7, 8, 3, 7, 4, 8, 5, 8),
                    ncol = 2,
                    byrow = T)
  numLeaves = 5

  support = c(0, 0, 0, 0, 0, 0, 0)
  subSupport = c(0, 0, 0, 0, 0, 0, 0)
  lfs = LatentForests(numLeaves, edgeList[support != 0,])
  lf = lfs$learnCoef(lfs$getModelWithSupport(support[support != 0]), lfs$getModelWithSupport(subSupport[support != 0]))
  expect_equal(lf$lambda, 2.5)
  expect_equal(lf$m, 1)

  support = c(0, 0, 0, 0, 0, 0, 0)
  subSupport = c(0, 0, 0, 0, 0, 0, 0)
  lfs = LatentForests(numLeaves, edgeList[support != 0,])
  lf = lfs$learnCoef(lfs$getModelWithSupport(support[support != 0]), lfs$getModelWithSupport(subSupport[support != 0]))
  expect_equal(lf$lambda, 2.5)
  expect_equal(lf$m, 1)

  support = rep(1, 7)
  subSupport = c(0, 0, 0, 1, 1, 1, 1)
  lfs = LatentForests(numLeaves, edgeList[support != 0,])
  lf = lfs$learnCoef(lfs$getModelWithSupport(support[support != 0]), lfs$getModelWithSupport(subSupport[support != 0]))
  expect_equal(lf$lambda, 4.75)
  expect_equal(lf$m, 1)

  support = rep(1, 7)
  subSupport = c(1, 0, 1, 1, 0, 0, 1)
  lfs = LatentForests(numLeaves, edgeList[support != 0,])
  lf = lfs$learnCoef(lfs$getModelWithSupport(support[support != 0]), lfs$getModelWithSupport(subSupport[support != 0]))
  expect_equal(lf$lambda, 4.5)
  expect_equal(lf$m, 1)

  support = c(1, 1, 0, 1, 1, 1, 0)
  subSupport = c(1, 1, 0, 0, 0, 0, 0)
  lfs = LatentForests(numLeaves, edgeList[support != 0,])
  lf = lfs$learnCoef(lfs$getModelWithSupport(support[support != 0]), lfs$getModelWithSupport(subSupport[support != 0]))
  expect_equal(lf$lambda, 3.5)
  expect_equal(lf$m, 3)
})

test_that("getSubModelSupports works", {
  edgeList = matrix(c(1,5,2,5,5,6,6,3,6,4), ncol=2, byrow=T)
  supports = getSubModelSupports(4, edgeList)
  expect_true(is.matrix(supports))
  supportsAsString = apply(supports, 1, function(x) {paste(x, collapse="")})
  expected = c("11111", "01111", "10111", "11011", "11101", "11110", "00011", "11000", "01110", "10110", "01101", "10101", "00000")
  expect_equal(length(expected), length(supportsAsString))
  expect_true(all(expected %in% supportsAsString))
})

############################
# Testing Misc Functions ###
############################

test_that("forestToString works", {
  edgeList = matrix(c(1,6,2,6,6,7,7,8,3,7,4,8,5,8), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(2)((3)((4)(5))))"
  )

  edgeList = matrix(c(1,6,2,6,7,8,3,7,4,8,5,8), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(2))|((3)(4)(5))"
  )

  edgeList = matrix(c(1,6,2,6,4,8,5,8), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(2))|(3)|((4)(5))"
  )

  edgeList = matrix(c(1,6,2,6), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(2))|(3)|(4)|(5)"
  )

  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.empty(5, directed=F), numLeaves),
    "(1)|(2)|(3)|(4)|(5)"
  )

  # Permuting

  edgeList = matrix(c(5,6,6,2,6,7,7,4,7,8,8,3,8,1), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(((2)(5))(4))(3))"
  )

  edgeList = matrix(c(5,6,6,2,7,4,7,8,8,3,8,1), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(3)(4))|((2)(5))"
  )

  edgeList = matrix(c(7,4,7,8,8,3,8,1), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(3)(4))|(2)|(5)"
  )

  edgeList = matrix(c(8,3,8,1), ncol=2, byrow=T)
  numLeaves = 5
  expect_equal(
    forestToString(igraph::graph.edgelist(edgeList, directed=F), numLeaves),
    "((1)(3))|(2)|(4)|(5)"
  )
})


test_that("isSubPartition works", {
  expect_true(isSubPartition(c(1,1,1,1), c(1,1,1,123151)))
  expect_true(isSubPartition(c(1.1,1.1,1.1,1.1), c(1.1,1,1,123151)))
  expect_true(isSubPartition(c(1), c(3)))
  expect_true(isSubPartition(c(1,2), c(1,-30)))
  expect_false(isSubPartition(c(1,2), c(1,1)))
  expect_true(isSubPartition(c(1,1,2,2,3,3,3,3), c(1,1,2,3,4,5,7,7)))
  expect_false(isSubPartition(c(1,1,2,2,3,3,3,3), c(1,1,2,7,4,5,7,7)))
  expect_false(isSubPartition(c(1,1,2,2,3,3,3,2), c(1,1,2,3,4,5,7,7)))
  expect_false(isSubPartition(c(1,1,2,2,3,3,3,2), c(1,1,2,3,4,5,7,7)))
})

test_that("forestFromTreeEdgesAndSupport works", {
  set.seed(123512)
  for(i in 1:10) {
    g = igraph::graph.full(5, directed=F)
    edgeList = igraph::get.edgelist(g)
    support = sample(c(0,1), nrow(edgeList), replace=T, prob=c(.8, 1))
    newG = forestFromTreeEdgesAndSupport(
      g,
      edgeList,
      support)
    expect_equal(edgeList[support == 1,], igraph::get.edgelist(newG))
  }

  g = igraph::graph.full(5, directed=F)
  edgeList = igraph::get.edgelist(g)
  support = rep(0, nrow(edgeList))
  newG = forestFromTreeEdgesAndSupport(
    g,
    edgeList,
    support)
  expect_equal(edgeList[support == 1,], igraph::get.edgelist(newG))

  g = igraph::graph.full(0, directed=F)
  edgeList = igraph::get.edgelist(g)
  support = rep(0, nrow(edgeList))
  newG = forestFromTreeEdgesAndSupport(
    g,
    edgeList,
    support)
  expect_equal(edgeList[support == 1,], igraph::get.edgelist(newG))
})

test_that("edgesInRootedDAGOrder works", {
  expect_true(isRootedDag(igraph::graph.edgelist(edgesInRootedDAGOrder(c(1,2,1,3,1,4), 1))))
  expect_true(isRootedDag(igraph::graph.edgelist(edgesInRootedDAGOrder(c(1,2,1,3,1,4), 2))))
  expect_true(isRootedDag(igraph::graph.edgelist(edgesInRootedDAGOrder(c(1,2,1,3,1,4), 3))))
  expect_true(isRootedDag(igraph::graph.edgelist(edgesInRootedDAGOrder(c(1,2,1,3,1,4), 4))))

  g = igraph::graph.edgelist(edgesInRootedDAGOrder(c(2,1,3,1,4,1), 4))
  expect_true(isRootedDag(g))
  expect_true(length(igraph::incident(g, 4, "in")) == 0)

  g = igraph::graph.edgelist(edgesInRootedDAGOrder(c(2,1,3,1,4,1,4,5,6,5)))
  expect_true(isRootedDag(g))
  expect_true(length(igraph::incident(g, 6, "in")) == 0)
})

test_that("removeDeg2Nodes works", {
  g1 = igraph::graph.edgelist(matrix(c(4,1,4,2,4,3), ncol=2, byrow=T), directed=F)
  g2 = removeDeg2Nodes(g1)
  expect_true(all(igraph::degree(g2) == c(1,1,1,3)))
  expect_equal(forestToString(g1, 3), forestToString(g2, 3))

  g1 = igraph::graph.edgelist(matrix(c(5,1,5,2,5,6,6,7,7,3,7,4), ncol=2, byrow=T), directed=F)
  g2 = removeDeg2Nodes(g1)
  expect_true(all(igraph::degree(g2) == c(1,1,1,1,3,0,3)))
  expect_equal(forestToString(g1, 4), forestToString(g2, 4))

  g1 = igraph::graph.edgelist(matrix(c(5,1,5,2,5,6,6,7,7,3,7,8,8,9,9,10,10,4), ncol=2, byrow=T), directed=F)
  g2 = removeDeg2Nodes(g1)
  expect_true(all(igraph::degree(g2) == c(1,1,1,1,3,0,3,0,0,0)))
  expect_equal(forestToString(g1, 4), forestToString(g2, 4))

})

test_that("forestDistance works", {
  f1 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::graph.edgelist(matrix(c(1,5,5,2,6,3,6,4), ncol=2, byrow=T), directed=F)
  expect_equal(forestDistance(f1,f2,4), 1)

  f1 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::delete.edges(f2, c(1,2,3))
  expect_equal(forestDistance(f1,f2,4), 2)

  f1 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::delete.edges(f2, c(3,4,5))
  expect_equal(forestDistance(f2, f1, 4), -2)

  f1 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::graph.edgelist(matrix(c(1,5,5,2,5,6,6,3,6,4), ncol=2, byrow=T), directed=F)
  f2 = igraph::delete.edges(f2, c(1,2,3,4,5))
  expect_equal(forestDistance(f1, f2, 4), 3)

  f1 = igraph::graph.empty(12, directed=F)
  f2 = igraph::graph.empty(12, directed=F)
  expect_equal(forestDistance(f2, f1, 4), 0)
})

test_that("forestDepth works", {
  expect_equal(forestDepth(igraph::graph.edgelist(matrix(
    c(4, 1, 4, 2, 4, 3), ncol = 2, byrow = T
  ), directed = F),
  3),
  2)
  g = igraph::graph.edgelist(matrix(c(5, 1, 5, 2, 5, 6, 6, 3, 6, 4), ncol =
                                      2, byrow = T), directed = F)
  g = igraph::delete.edges(g, c(1, 2, 3))
  expect_equal(forestDepth(g,
                           4),
               1)
  g = igraph::graph.edgelist(matrix(c(5, 1, 5, 2, 5, 6, 6, 3, 6, 4), ncol =
                                      2, byrow = T), directed = F)
  g = igraph::delete.edges(g, c(1))
  expect_equal(forestDepth(g,
                           4),
               2)
})
