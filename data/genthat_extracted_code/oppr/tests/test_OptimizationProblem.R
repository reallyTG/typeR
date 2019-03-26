context("OptimizationProblem")

test_that("new problem", {
  # data
  x <- new_optimization_problem()
  # tests
  expect_equal(ncell(x), 0)
})

test_that("get methods", {
  # data
  l <- list(
    modelsense = "min",
    A_i = c(0L, 1L, 1L),
    A_j = c(0L, 1L, 2L),
    A_x = c(7, 8, 9),
    obj = c(9, 10, 11),
    pwlobj = list(1),
    lb = c(12, 13, 14),
    ub = c(15, 16, 17),
    rhs = c(18, 19),
    number_of_projects = 2,
    number_of_actions = 3,
    number_of_features = 1,
    number_of_branches = 10,
    sense = c("=", "="),
    vtype = c("B", "S", "C"),
    row_ids = c("a", "b"),
    col_ids = c("d", "e", "f"))
  x <- predefined_optimization_problem(l, list(i = 4))
  # tests
  expect_equal(nrow(x), 2)
  expect_equal(ncol(x), 3)
  expect_equal(ncell(x), length(l$A_x))
  expect_equal(A(x), Matrix::sparseMatrix(i = l$A_i, j = l$A_j, x = l$A_x,
                                          index1 = FALSE))
  expect_equal(modelsense(x), l$modelsense)
  expect_equal(obj(x), l$obj)
  expect_equal(pwlobj(x), l$pwlobj)
  expect_equal(rhs(x), l$rhs)
  expect_equal(sense(x), l$sense)
  expect_equal(lb(x), l$lb)
  expect_equal(ub(x), l$ub)
  expect_equal(number_of_projects(x), l$number_of_projects)
  expect_equal(number_of_actions(x), l$number_of_actions)
  expect_equal(number_of_features(x), l$number_of_features)
  expect_equal(number_of_branches(x), l$number_of_branches)
  expect_equal(col_ids(x), l$col_ids)
  expect_equal(row_ids(x), l$row_ids)
  expect_equal(get_data(x), list(i = 4))
})

test_that("as.list", {
  # data
  l <- list(
    modelsense = "min",
    A_i = c(0L, 1L, 1L),
    A_j = c(0L, 1L, 2L),
    A_x = c(7, 8, 9),
    obj = c(9, 10, 11),
    pwlobj = list(500),
    lb = c(12, 13, 14),
    ub = c(15, 16, 17),
    rhs = c(18, 19),
    number_of_projects = 2,
    number_of_actions = 3,
    number_of_features = 1,
    number_of_branches = 10,
    sense = c("=", "="),
    vtype = c("B", "S", "C"),
    row_ids = c("a", "b"),
    col_ids = c("d", "e", "f"))
  l2 <- as.list(predefined_optimization_problem(l))
  # tests
  expect_equal(l$modelsense, l2$modelsense)
  expect_equal(l$A_i, l2$A_i)
  expect_equal(l$A_j, l2$A_j)
  expect_equal(l$A_x, l2$A_x)
  expect_equal(l$obj, l2$obj)
  expect_equal(l$pwlobj, l2$pwlobj)
  expect_equal(l$lb, l2$lb)
  expect_equal(l$ub, l2$ub)
  expect_equal(l$rhs, l2$rhs)
  expect_equal(l$number_of_projects, l2$number_of_projects)
  expect_equal(l$number_of_actions, l2$number_of_actions)
  expect_equal(l$number_of_features, l2$number_of_features)
  expect_equal(l$number_of_branches, l2$number_of_branches)
  expect_equal(l$sense, l2$sense)
  expect_equal(l$vtype, l2$vtype)
  expect_equal(l$row_ids, l2$row_ids)
  expect_equal(l$col_ids, l2$col_ids)
})
