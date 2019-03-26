context("graph generators")

test_that("node generators work:", {
  g = graph(0, 100)
  n = 25L

  node.setups = list(
    list(generator = addNodesUniform, pars = list()),
    list(generator = addNodesLHS, pars = list()),
    list(generator = addNodesGrid, pars = list()),
    list(generator = addNodesTriangular, pars = list()),
    list(generator = addNodesNormal, pars = list(x.mean = 50, y.mean = 50, x.sd = 3, y.sd = 1))
  )

  for (node.setup in node.setups) {
    node.generator = node.setup$generator
    pars = c(list(graph = g, n = n, generator = node.generator), node.setup$pars)
    g1 = do.call(addNodes, pars)
    expect_equal(getNumberOfNodes(g1), n)
    expect_true(all(g1$coordinates >= 0))
  }
})

test_that("edge generators work:", {
  g = graph(0, 100)
  n = 25L
  g = addNodes(g, n = n, generator = addNodesUniform)

  edge.setups = list(
    list(generator = addEdgesDelauney, pars = list()),
    list(generator = addEdgesWaxman, pars = list(alpha = 0.3, beta = 0.1)),
    list(generator = addEdgesGilbert, pars = list(p = 0.3)),
    list(generator = addEdgesErdosRenyi, pars = list(m = floor(n / 2 - 4))),
    list(generator = addEdgesSpanningTree, pars = list(runs = 3L)),
    list(generator = addEdgesComplete, pars = list()),
    list(generator = addEdgesOnion, pars = list()),
    list(generator = addEdgesGrid, pars = list())
  )

  for (edge.setup in edge.setups) {
    edge.generator = edge.setup$generator
    pars = c(list(graph = g, generator = edge.generator), edge.setup$pars)
    g1 = do.call(addEdges, pars)
    adj.mat = getAdjacencyMatrix(g1)
    expect_true(!is.null(adj.mat))
    expect_true(isSymmetricMatrix(adj.mat))
    expect_true(all(diag(adj.mat) == 0))
  }
})

test_that("weight generators work:", {
  g = graph(0, 100)
  n = 25L
  g = addNodes(g, n = n, generator = addNodesUniform)
  g = addEdges(g, generator = addEdgesDelauney)

  weight.setups = list(
    list(generator = addWeightsRandom, pars = list(method = rexp, rate = 0.1)),
    list(generator = addWeightsDistance, pars = list(method = "minkowski", p = 3)),
    list(generator = addWeightsCorrelated, pars = list(rho = 0.4)),
    list(generator = addWeightsConcave, pars = list(xhi = 10, nu = 19, M = 1000))
  )

  for (weight.setup in weight.setups) {
    weight.generator = weight.setup$generator
    pars = c(list(graph = g, generator = weight.generator), weight.setup$pars)
    g1 = do.call(addWeights, pars)
    expect_true(length(g1$weights) > 0L)
    expect_true(all(sapply(g1$weights, function(w) all(dim(w) == n))))
    expect_true(all(sapply(g1$weights, isSymmetricMatrix)))
    expect_true(all(sapply(g1$weights, function(w) all(diag(w) == 0))))
  }
})

test_that("graph generation: simple graph", {
  # here we generate a complex biobjective graph problem
  # with both euclidean and random weights

  g = graph(lower = 0, upper = 100)
  g = addNodes(g, n = 25L, generator = addNodesUniform)
  g = addWeights(g, generator = addWeightsDistance, method = "euclidean", symmetric = TRUE)
  # check if plotting works
  pls = plot(g)
  expect_list(pls, types = "ggplot", len = 2L, any.missing = FALSE, all.missing = FALSE)
  pls = plot(g, weight.plot.type = "ecdf")
  expect_list(pls, types = "ggplot", len = 2L, any.missing = FALSE, all.missing = FALSE)

  # add additional weight
  g = addWeights(g, generator = addWeightsRandom, method = runif, symmetric = TRUE)

  expect_class(g, "grapherator")
  expect_true(g$n.nodes == 25L)
  expect_true(g$n.clusters == 0L)
  expect_true(g$n.weights == 2L)
  expect_set_equal(g$weight.types, c("DWG", "RWG"))
  expect_true(isSymmetricMatrix(g$weights[[1L]]))
  expect_true(isSymmetricMatrix(g$weights[[2L]]))
  expect_output(print(g), regexp = "GRAPH")
  expect_character(as.character(g))

  pls = plot(g)
  expect_list(pls, types = "ggplot", len = 2L, any.missing = FALSE, all.missing = FALSE)
})

test_that("graph generation: complex clustered graph", {
  g = graph(lower = 0, upper = 100)
  g = addNodes(g, n = 3L, generator = addNodesLHS)
  g = addNodes(g, n = 9L, by.centers = TRUE, generator = addNodesUniform, lower = c(0, 0), upper = c(1, 1))
  g = addNodes(g, n = 25L, generator = addNodesGrid)
  g = addEdges(g, generator = addEdgesGilbert, p = 0.3)
  g = addWeights(g, generator = addWeightsRandom, method = rnorm, mean = 5, sd = 1.3)
  g = addWeights(g, generator = addWeightsDistance, method = "minkowski", p = 2.5, symmetric = FALSE)

  # check plotting of cluster centers
  pls = plot(g, show.cluster.centers = TRUE)
  expect_list(pls, types = "ggplot", len = 2L, any.missing = FALSE, all.missing = FALSE)

  g = addWeights(g, generator = addWeightsRandom, method = function(n) {
    sample(c(1, -10), n, replace = TRUE) * rexp(n, rate = 0.1) * 1:n
  })

  expect_class(g, "grapherator")
  expect_true(g$n.nodes == 55L)
  expect_true(g$n.clusters == 3L)
  expect_true(g$n.weights == 3L)
  expect_list(g$weights, types = "matrix", any.missing = FALSE, all.missing = FALSE, len = g$n.weights)
  expect_true(isSymmetricMatrix(g$weights[[1L]]))
  expect_true(isSymmetricMatrix(g$weights[[2L]]))
  expect_true(isSymmetricMatrix(g$weights[[3L]])) # distance based are always symmetric

  expect_error(plot(g), regexpr = "not supported")
})

test_that("graph generation: complex clustered graph with complex edge structure", {
  g = graph(lower = 0, upper = 100)
  g = addNodes(g, n = 5L, generator = addNodesLHS)
  g = addNodes(g, n = 7L, by.centers = TRUE, generator = addNodesUniform, lower = c(0, 0), upper = c(5, 5))
  g = addEdges(g, type = "intercenter", generator = addEdgesSpanningTree)
  g = addEdges(g, type = "intercluster", k = c(2L, 3L, 2L, NA, NA, NA, 4L), generator = addEdgesDelauney)
  g = addEdges(g, type = "intracluster", generator = addEdgesSpanningTree)
  g = addWeights(g, generator = addWeightsRandom, method = rnorm, mean = 5, sd = 1.3)
  g = addWeights(g, generator = addWeightsDistance, method = "minkowski", p = 2.5, symmetric = FALSE)

  # check plotting of cluster centers
  pls = plot(g, show.cluster.centers = TRUE)
  expect_list(pls, types = "ggplot", len = 2L, any.missing = FALSE, all.missing = FALSE)

  expect_class(g, "grapherator")
  expect_true(g$n.nodes == 5 * (7 + 1L))
  expect_true(g$n.clusters == 5L)
  expect_true(g$n.weights == 2L)
  expect_list(g$weights, types = "matrix", any.missing = FALSE, all.missing = FALSE, len = g$n.weights)
  expect_true(isSymmetricMatrix(g$weights[[1L]]))
  expect_true(isSymmetricMatrix(g$weights[[2L]]))
})

test_that("graph generation: manual passing of coordinates weights works", {
  g = graph(lower = 0, upper = 10)
  center.coordinates = matrix(c(1, 2, 2, 5, 8, 3), byrow = TRUE, ncol = 2L)
  g = addNodes(g, coordinates = center.coordinates)
  g = addNodes(g, n = 9L, by.centers = TRUE, generator = addNodesGrid, lower = c(0, 0), upper = c(2, 2))
  expect_equal(center.coordinates, g$center.coordinates)
  weights = diag(30)
  g = addWeights(g, weights = weights)
  g = addWeights(g, generator = addWeightsRandom, method = rnorm, mean = 5, sd = 1.3)
  weights[1, 4] = 4
  g = addWeights(g, weights = weights)

  expect_class(g, "grapherator")
  expect_true(g$n.nodes == 30L)
  expect_true(g$n.clusters == 3L)
  expect_true(g$n.weights == 3L)
  expect_list(g$weights, types = "matrix", any.missing = FALSE, all.missing = FALSE, len = g$n.weights)
  expect_true(isSymmetricMatrix(g$weights[[1L]]))
  expect_true(isSymmetricMatrix(g$weights[[2L]]))
  expect_true(isSymmetricMatrix(g$weights[[3L]])) # converted to symmetric matrix internally
})


test_that("graph generation: check correct error messages", {
  expect_error(graph(lower = 10, upper = 5))

  g = graph(lower = 0, upper = 100)
  expect_error(addWeights(g, generator = addWeightsDistance, method = "euclidean"), regexp = "first place")
})
