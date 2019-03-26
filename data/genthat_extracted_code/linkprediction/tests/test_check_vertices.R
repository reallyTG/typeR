context("Checking 'check_vertices'")

g <- igraph::graph(c(1,2, 1,3, 1,4, 2,4, 1,5, 2,5, 4,5), directed = FALSE)
igraph::V(g)$name <- letters[5:1]
check_vertices <- linkprediction:::check_vertices

test_that("Wrong vertices sequences throw an error",{
  expect_error(check_vertices(g, v = 6))
  expect_error(check_vertices(g, v = "f"))
  expect_error(check_vertices(g, v = 3:6))
  expect_error(check_vertices(g, v = c("a", "c", "f")))
  expect_error(check_vertices(g, v = 1, v2 = 6))
  expect_error(check_vertices(g, v = 1, v2 = "f"))
})


test_that("Names are coerced to IDs",{
  expect_identical(check_vertices(g, v = "a"), 5L)
  expect_identical(check_vertices(g, v = "e"), 1L)
  expect_identical(check_vertices(g, v = letters[1:5]), 5:1)
  expect_identical(check_vertices(g, v = letters[5:1]), 1:5)
})
