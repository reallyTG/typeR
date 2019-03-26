library(netdep)
library(igraph)


test_that("Test whether latent variable dependent network can be generated appropriately",{
  n = 100; rho = 0.5
  net = latent.netdep(n.node = n, rho = rho, dep.factor = 1, dep.range = c(-5, 5))

  expect_equal(length(V(net)$outcome), n)
  expect_equal(length(V(net)$latent), n)
})

test_that("Test whether snowball sampling is working appropriately", {
  n = 200; rho = 0.5
  G = latent.netdep(n.node = n, rho = rho, dep.factor = -3, dep.range = c(-10, 0))
  subG = snowball.sampling(G, n/2)

  expect_equal(length(V(subG$subG)$outcome), n/2)
  expect_true(is.connected(subG$subG))
})


test_that("Test whether network-dependent outcomes due to direct transmission process are generated appropriately", {
  G = latent.netdep(n.node = 100, rho = 0.2)
  A = as.matrix(get.adjacency(G))
  times = 3
  outcomes = peer.process(A, max.time = times, mprob = 0.3, epsilon = 0.5)

  expect_equal(length(outcomes), times + 1)
  expect_equal(length(outcomes$time0), 100)
})



test_that("Test that Moran's I and Phi are correctly derived", {
  set.seed(123)
  G = latent.netdep(n.node = 50, rho = 0.2)
  A = as.matrix(get.adjacency(G))
  Y = V(G)$outcome
  Y = ifelse(Y < 0, 0, 1)
  result.phi = make.permute.Phi(A, Y, np = 50)
  result.moran = make.permute.moran(A, Y, np = 50)

  expect_true(abs(result.phi$phi-result.moran$moran) < 0.001)

})
