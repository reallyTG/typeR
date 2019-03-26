context("Testing Adamic-Adar")


test_that("AA works correctly for a line network", {
  g <- igraph::make_graph(~ a -- b -- c)
  m <- proxfun(g, method="aa")
  expect_equal(m[1,3], 1 / log(2) )
  expect_equal(m[3,1], 1 / log(2) )
})



