context("fit_multinom_dag")

# set up input variable
data <- generate_fixed_discrete_data_frame()
data_matrix <- as.matrix(data)
colnames(data_matrix) <- NULL
node <- ncol(data)
n_levels <- unlist(auto_count_levels(data))
li <- vector("list", length = node)
li[[1]] <- c(2L,4L)
li[[2]] <- c(3L,4L,5L)
li[[3]] <- c(2L,5L)
li[[4]] <- integer(0)
li[[5]] <- integer(0)
edge_list <- edgeList(li)

# test
test_that("fit_multinom_dag can take empty graphs", {
  ### test if I input a graph with a single node, will the algorithm work.
  data_single <- as.data.frame(matrix(c(0, 1, 2, 0, 0, 3, 3, 2, 2, 1), nrow=10))
  ### Generate fixed objects for empty graphs
  generate_empty_edgeList <- function(){
    sparsebnUtils::edgeList(list(integer(0)))
  }
  single_node <- generate_empty_edgeList()
  expect_error(fit_multinom_dag(single_node, data_single), NA)
})

test_that("fit_multinom_dag can run", {
  ### fit_multinom_dag can accept an edgeList object and a data.frame object as an input
  expect_error(fit_multinom_dag(edge_list, data), NA)

  ### fit_multinom_dag can accept an edgeList object and a matrix as an input
  expect_error(fit_multinom_dag(edge_list, data_matrix), NA)

  ### throw an error if fit_multinom_dag has the wrong input
  expect_error(fit_multinom_dag(final.dag, data))
})

test_that("fit_multinom_dag output the right result", {
  out <- fit_multinom_dag(edge_list, data) # input a data frame

  n_levels <- c(2, 2, 3, 2, 2)
  n_effect_levels <- n_levels-1

  ### length of output should be the number of variables
  expect_equal(length(out), node)

  ### dimension of each element should be right
  expect_equal(length(out[[1]]), 1+sum(n_effect_levels[edge_list[[1]]]))
  expect_equal(length(out[[2]]), 1+sum(n_effect_levels[edge_list[[2]]]))
  expect_equal(dim(out[[3]]), c(n_effect_levels[3], 1+sum(n_effect_levels[edge_list[[1]]])))

  ### coefficient names are correct
  expect_equal(names(out[[1]]), c("(Intercept)", "y_1", "a_1"))
  expect_equal(names(out[[2]]), c("(Intercept)", "z_1", "z_2", "a_1", "b_1"))
  expect_equal(colnames(out[[3]]), c("(Intercept)", "y_1", "b_1"))
})
