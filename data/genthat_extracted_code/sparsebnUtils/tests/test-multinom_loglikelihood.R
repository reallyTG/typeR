context("multinom_loglikelihood")

# set up input variable
data <- matrix(c(1, 1, 0, 0, 1, 1,
                 1, 1, 0, 1, 1, 1,
                 0, 0, 1, 0, 0, 1,
                 0, 0, 1, 0, 0, 1,
                 0, 0, 0, 1, 1, 0,
                 0, 0, 0, 1, 1, 1,
                 1, 1, 1, 1, 0, 0,
                 1, 0, 1, 1, 0, 1,
                 0, 0, 0, 0, 1, 0,
                 1, 1, 1, 1, 0, 1,
                 1, 1, 0, 1, 1, 1,
                 0, 0, 1, 0, 0, 1,
                 1, 1, 0, 1, 0, 0,
                 1, 0, 1, 1, 0, 1,
                 1, 1, 1, 1, 1, 0,
                 1, 0, 1, 1, 1, 1,
                 0, 0, 1, 0, 0, 0,
                 1, 1, 0, 1, 1, 1,
                 1, 1, 1, 0, 0, 0,
                 1, 1, 1, 1, 0, 0,
                 0, 0, 0, 0, 1, 0,
                 0, 0, 1, 0, 0, 0,
                 1, 0, 0, 0, 1, 1,
                 0, 0, 1, 0, 0, 0,
                 1, 0, 1, 1, 0, 1,
                 0, 0, 0, 1, 1, 0,
                 0, 0, 0, 0, 0, 0,
                 0, 0, 1, 0, 1, 0,
                 0, 0, 1, 0, 0, 0,
                 0, 0, 1, 0, 0, 0), byrow = TRUE, ncol = 6)
dat <- as.data.frame(data)
edge_NULL <- lapply(1:6, function(x){integer(0)})
edge <- lapply(1:6, function(x){integer(0)})
edge[[1]] <-4; edge[[2]] <-1; edge[[4]] <-5; edge[[5]] <- 3; edge[[6]] <- 1
parent_NULL <- as.edgeList(edge_NULL)
parent <- as.edgeList(edge)

# test
test_that("multinom_loglikelihood run as expected", {
  # multinom can run with NULL graph
  expect_error(multinom_loglikelihood(parents = parent_NULL, data = dat), NA)
  # multinom can run with regular graph
  expect_error(multinom_loglikelihood(parents = parent, data = dat), NA)
})

test_that("Check input parent", {
  ### Throw error if parent is not edgeList object
  parent_list <- as.list(parent)
  expect_error(multinom_loglikelihood(parents = parent_list, data = dat))

})

test_that("Check input data", {
  ### Throw error if data is not data.frame
  expect_error(multinom_loglikelihood(parents = parent_list, data = data))

  ### Throw error if data is not compatible with parent
  parent_short <- parent[1:5]
  expect_error(multinom_loglikelihood(parents = parent_short, data = data))

})


