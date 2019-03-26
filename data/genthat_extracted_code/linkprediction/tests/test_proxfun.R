context("Checking if 'proxfun' handles argument correctly")

g <- igraph::graph(c(1,2, 1,3, 1,4, 2,4, 1,5, 2,5, 4,5), directed = FALSE)
igraph::V(g)$name <- letters[5:1]

test_that("Wrong vertices sequences throw an error",{
  expect_error(proxfun(g, "cn", v1 = 6))
  expect_error(proxfun(g, "cn", v1 = "f"))
  expect_error(proxfun(g, "cn", v1 = 3:6))
  expect_error(proxfun(g, "cn", v1 = c("a", "c", "f")))
  expect_error(proxfun(g, "cn", v1 = 1, v2 = 6))
  expect_error(proxfun(g, "cn", v1 = 1, v2 = "f"))
})


test_that("Error is thrown for empty network", {
  expect_error( proxfun( igraph::make_empty_graph(n=4, directed=FALSE) ) )
  expect_error( proxfun( igraph::make_empty_graph(n=4, directed=TRUE) ) )
})


test_that("Error is thrown for disconnected networks", {
  expect_error( proxfun(igraph::make_graph(c(1,2, 3,4), directed=FALSE)) )
})

test_that("Error is thrown for directed networks", {
  expect_error(
    proxfun( igraph::make_graph(c(1,2, 2,3, 3,4), directed=TRUE) )
  )
})







context("Check if `proxfun` return proper objects")

all_methods <- c("act", "act_n", "aa", "cn", "cos", "cos_l",
                 "dist", "hdi", "hpi", "jaccard", "katz", "l",
                 "lhn_local", "lhn_global", "lp", "mf", "pa", "ra",
                 "rwr", "sor")

g <- igraph::make_graph(~ a -- b -- c -- d)

for(m in all_methods) {
  test_that(
    paste("Checking calculating", sQuote(m), sep=" "),
    {
      testthat::expect_is(
        proxfun(g, method=m, value="matrix"),
        "matrix"
        )
      testthat::expect_is(
        proxfun(g, method=m, value="edgelist"),
        "data.frame"
      )
    }
  )
}

