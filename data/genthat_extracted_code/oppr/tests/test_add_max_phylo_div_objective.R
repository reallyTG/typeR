context("add_max_phylo_div_objective")

test_that("compile", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0),
                            locked_in = FALSE,
                            locked_out = FALSE)
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions()
  # create optimization problem
  o1 <- compile(p)
  o2 <- r_phylo_div_mip_formulation(projects, actions, tree, 0.16, 1000)
  # run tests
  expect_equal(o1$obj(), o2$obj)
  expect_equal(o1$vtype(), o2$vtype)
  expect_equal(o1$lb(), o2$lb)
  expect_equal(o1$ub(), o2$ub)
  expect_equal(o1$sense(), o2$sense)
  expect_equal(o1$rhs(), o2$rhs)
  expect_true(all(o1$A() == o2$A))
})

test_that("exact solver (simple problem, single solution", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  tree2 <- tree
  tree2$edge.length <- c(5, 100, 5, 5)
  # make problems
  p1 <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions()
  p2 <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.21, tree) %>%
       add_binary_decisions()
  p3 <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.11, tree2) %>%
       add_binary_decisions()
  # solve problems
  s1 <- solve(p1)
  s2 <- solve(p2)
  s3 <- solve(p3)
  # tests
  ## s1
  expect_is(s1, "tbl_df")
  expect_equal(nrow(s1), 1)
  expect_equal(s1$solution, 1L)
  expect_equal(s1$status, "OPTIMAL")
  expect_equal(s1$cost, 0.15)
  expect_equal(s1$obj, (5 * s1$F1) +
                       (5 * s1$F2) +
                       (5 * s1$F3) +
                       (100 * (1 - ((1 - (s1$F1)) * (1 - (s1$F2))))))
  expect_equal(s1$A1, 0)
  expect_equal(s1$A2, 0)
  expect_equal(s1$A3, 1)
  expect_equal(s1$A4, 1)
  expect_equal(s1$F1, 0.94 * 0.8)
  expect_equal(s1$F2, 0.94 * 0.8)
  expect_equal(s1$F3, 0.1 * 1)
  ## s2
  expect_is(s2, "tbl_df")
  expect_equal(nrow(s2), 1)
  expect_equal(s2$solution, 1L)
  expect_equal(s2$status, "OPTIMAL")
  expect_equal(s2$obj, (5 * s2$F1) +
                       (5 * s2$F2) +
                       (5 * s2$F3) +
                       (100 * (1 - ((1 - (s2$F1)) * (1 - (s2$F2))))))
  expect_equal(s2$cost, 0.2)
  expect_equal(s2$A1, 1)
  expect_equal(s2$A2, 1)
  expect_equal(s2$A3, 0)
  expect_equal(s2$A4, 1)
  expect_equal(s2$F1, 0.95 * 0.91)
  expect_equal(s2$F2, 0.96 * 0.92)
  expect_equal(s2$F3, 0.1 * 1)
  ## s3
  expect_is(s3, "tbl_df")
  expect_equal(nrow(s3), 1)
  expect_equal(s3$solution, 1L)
  expect_equal(s3$status, "OPTIMAL")
  expect_equal(s3$obj, (100 * s3$F1) +
                       (5 * s3$F2) +
                       (5 * s3$F3) +
                       (5 * (1 - ((1 - (s3$F1)) * (1 - (s3$F2))))))
  expect_equal(s3$cost, 0.1)
  expect_equal(s3$A1, 1)
  expect_equal(s3$A2, 0)
  expect_equal(s3$A3, 0)
  expect_equal(s3$A4, 1)
  expect_equal(s3$F1, 0.95 * 0.91)
  expect_equal(s3$F2, 0.1 * 1)
  expect_equal(s3$F3, 0.1 * 1)
})

test_that("exact solver (random order, no weights, single solution)", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.80),
                             F4 =       c(0.00, 0.00, 0.00, 0.80),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F3", "F4"))
  tree <- ape::read.tree(text = "((F3, F4), F1);")
  tree$edge.length <- rep(5, nrow(tree$edge))
  # make problems
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(verbose = FALSE) %>%
       solve()
  # solve problem
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, "OPTIMAL")
  expect_equal(s$obj, (5 * 0.95 * 0.91) +
                      (5 * 1 * 0.80) +
                      (5 * 1 * 0.80) +
                      (5 * (1 - ((1 - (0.8)) * (1 - (0.8))))))
  expect_equal(s$cost, 0.1)
  expect_equal(s$A1, 1)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.95 * 0.91)
  expect_equal(s$F3, 0.8 * 1)
  expect_equal(s$F4, 0.8 * 1)
})

test_that("exact solver (random order, weights, single solution)", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.00, 0.10),
                             F2 =       c(0.00, 0.00, 0.05, 0.01),
                             F3 =       c(0.00, 0.00, 0.00, 0.80),
                             F4 =       c(0.00, 0.00, 0.00, 0.80),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3", "F4"))
  tree <- ape::read.tree(text = "(((F3, F4), F1), F2);")
  tree$edge.length <- rep(5, nrow(tree$edge))
  # make problems
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_feature_weights(c(4, 1000, 2, 4)) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(verbose = FALSE) %>%
       solve()
  # solve problem
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, "OPTIMAL")
  expect_equal(s$obj,
    (5 * 0.1 * 1) + (4 * 0.1 * 1) +
    (5 * 0.05 * 0.94) + (1000 * 0.05 * 0.94) +
    (5 * 1 * 0.80) + (2 * 0.8 * 1) +
    (5 * 1 * 0.80) + (4 * 0.8 * 1) +
    (5 * (1 - ((1 - (0.8)) * (1 - (0.8))))) +
    (5 * (1 - ((1 - (0.8)) * (1 - (0.8)) * (1 - (0.1 * 1))))))
  expect_equal(s$cost, 0.15)
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.1 * 1)
  expect_equal(s$F2, 0.05 * 0.94)
  expect_equal(s$F3, 0.8 * 1)
  expect_equal(s$F4, 0.8 * 1)
})

test_that("exact solver (simple problem, multiple solutions", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.2, tree) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_equal(s$obj, (5 * s$F1) +
                      (5 * s$F2) +
                      (5 * s$F3) +
                      (100 * (1 - ((1 - (s$F1)) * (1 - (s$F2))))))
  expect_true(all(s$cost <= 0.2))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, ifelse(abs(s$obj - max(s$obj)) < 1e-10,
                                "OPTIMAL", "SUBOPTIMAL"))
  expect_is(s$A1, "numeric")
  expect_is(s$A2, "numeric")
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("exact solver (constant branch probabilities, single solution", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 1.0),
                             F4 =       c(0.00, 0.00, 0.00, 1.0),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3", "F4"))
  tree <- ape::read.tree(text = "((F1,F2),(F3,F4));")
  tree$edge.length <- c(5, 5, 5, 5, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions()
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, "OPTIMAL")
  expect_equal(s$obj, (0.752 * 5) +
                      (0.752 * 5) +
                      (1 * 5) +
                      (1 * 5) +
                      ((1 - ((1 - 0.752) * (1 - 0.752))) * 5) +
                      ((1 - ((1 - 1) * (1 - 1))) * 5))
  expect_equal(s$cost, 0.15)
  expect_equal(s$F1, 0.94 * 0.8)
  expect_equal(s$F2, 0.94 * 0.8)
  expect_equal(s$F3, 1.0)
  expect_equal(s$F4, 1.0)
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("exact solver (locked constraints, multiple solutions)", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(100, tree) %>%
       add_locked_in_constraints(1) %>%
       add_locked_out_constraints(2) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_equal(s$obj, (5 * s$F1) +
                      (5 * s$F2) +
                      (5 * s$F3) +
                      (100 * (1 - ((1 - (s$F1)) * (1 - (s$F2))))))
  expect_true(all(s$cost <= 0.25))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, ifelse(abs(s$obj - max(s$obj)) < 1e-10,
                                "OPTIMAL", "SUBOPTIMAL"))
  expect_is(s$A1, "numeric")
  expect_true(all(s$A1 > 0.5))
  expect_is(s$A2, "numeric")
  expect_true(all(s$A2 < 0.5))
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("heuristic solver (simple problem, single solution", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions() %>%
       add_heuristic_solver()
  # solve problems
  s <- solve(p)
  # tests
  expect_equal(s$solution, 1L)
  expect_equal(s$status, NA_character_)
  expect_equal(s$cost, 0.1)
  expect_equal(s$obj, (5 * s$F1) +
                       (5 * s$F2) +
                       (5 * s$F3) +
                       (100 * (1 - ((1 - (s$F1)) * (1 - (s$F2))))))
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 1)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.1 * 1)
  expect_equal(s$F2, 0.96 * 0.92)
  expect_equal(s$F3, 0.1 * 1)
})

test_that("exact solver (random order, weights, single solution)", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.80),
                             F4 =       c(0.00, 0.00, 0.00, 0.80),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F3", "F4"))
  tree <- ape::read.tree(text = "((F3, F4), F1);")
  tree$edge.length <- rep(5, nrow(tree$edge))
  # make problems
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions() %>%
       add_feature_weights(c(4, 8, 90)) %>%
       add_heuristic_solver(verbose = FALSE) %>%
       solve()
  # solve problem
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, NA_character_)
  expect_equal(s$obj, (5 * 0.95 * 0.91) + ((4 * 0.95 * 0.91)) +
                      (5 * 1 * 0.80) + (8 * 1 * 0.80) +
                      (5 * 1 * 0.80) + (90 * 1 * 0.80) +
                      (5 * (1 - ((1 - (0.8)) * (1 - (0.8))))))
  expect_equal(s$cost, 0.1)
  expect_equal(s$A1, 1)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.95 * 0.91)
  expect_equal(s$F3, 0.8 * 1)
  expect_equal(s$F4, 0.8 * 1)
})

test_that("exact solver (random order, no weights, single solution)", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.80),
                             F4 =       c(0.00, 0.00, 0.00, 0.80),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F3", "F4"))
  tree <- ape::read.tree(text = "((F3, F4), F1);")
  tree$edge.length <- rep(5, nrow(tree$edge))
  # make problems
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.16, tree) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE) %>%
       solve()
  # solve problem
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, NA_character_)
  expect_equal(s$obj, (5 * 0.95 * 0.91) +
                      (5 * 1 * 0.80) +
                      (5 * 1 * 0.80) +
                      (5 * (1 - ((1 - (0.8)) * (1 - (0.8))))))
  expect_equal(s$cost, 0.1)
  expect_equal(s$A1, 1)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.95 * 0.91)
  expect_equal(s$F3, 0.8 * 1)
  expect_equal(s$F4, 0.8 * 1)
})

test_that("heuristic solver (simple problem, multiple solutions", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.2, tree) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_equal(s$obj, (5 * s$F1) +
                      (5 * s$F2) +
                      (5 * s$F3) +
                      (100 * (1 - ((1 - (s$F1)) * (1 - (s$F2))))))
  expect_true(all(s$cost <= 0.2))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, rep(NA_character_, nrow(s)))
  expect_is(s$A1, "numeric")
  expect_is(s$A2, "numeric")
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("heuristic solver (locked constraints, multiple solutions)", {
  # create data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # make problems
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(0.2, tree) %>%
       add_locked_in_constraints(1) %>%
       add_locked_out_constraints(2) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, NA_character_)
  expect_equal(s$cost, 0.1)
  expect_equal(s$obj, (5 * s$F1) +
                      (5 * s$F2) +
                      (5 * s$F3) +
                      (100 * (1 - ((1 - (s$F1)) * (1 - (s$F2))))))
  expect_equal(s$A1, 1)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
  expect_equal(s$F1, 0.95 * 0.91)
  expect_equal(s$F2, 0.1 * 1)
  expect_equal(s$F3, 0.1 * 1)
})

test_that("invalid arguments", {
  data(sim_projects, sim_actions, sim_features, sim_tree)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE)
  ## budgets
  expect_error({
    add_max_phylo_div_objective(p, NA_real_, sim_tree)
  })
  expect_error({
    add_max_phylo_div_objective(p, c(1, 1), sim_tree)
  })
  expect_error({
    add_max_phylo_div_objective(p, "a", sim_tree)
  })
  expect_error({
    add_max_phylo_div_objective(p, TRUE, sim_tree)
  })
  ## tree
  expect_error({
    add_max_phylo_div_objective(p, 1e+5, 1)
  })
  expect_error({
    sim_tree2 <- sim_tree
    sim_tree2$Nnode <- 1
    add_max_phylo_div_objective(p, 1e+5, sim_tree2)
  })
  expect_error({
    sim_tree2 <- ape::drop.tip(sim_tree, "F1")
    add_max_phylo_div_objective(p, 1e+5, sim_tree2)
  })
  expect_error({
    p %>%
    add_max_phylo_div_objective(1e+5, sim_tree) %>%
    add_rsymphony_solver() %>%
    solve()
  })
  skip_if_not_installed("gurobi", "8.0.0")
  expect_warning({
    p %>%
    add_max_phylo_div_objective(1e+5, replace(sim_tree, "edge.length",
                                              NULL)) %>%
    solve()
  })
})

test_that("solution_statistics", {
  # create data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"),
                             weight = c(100, 4, 9))
  tree <- ape::read.tree(text = "((F1,F2),F3);")
  tree$edge.length <- c(100, 5, 5, 5)
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_phylo_div_objective(budget = 0.16, tree) %>%
       add_feature_weights("weight") %>%
       add_binary_decisions()
  # create solutions
  s <- data.frame(A1 = c(1, 0, 0, 1),
                  A2 = c(1, 1, 0, 1),
                  A3 = c(0, 0, 1, 1),
                  A4 = c(1, 1, 1, 1))
  # evaluate solutions
  ss <- solution_statistics(p, s)
  # tests
  expect_equal(ss$cost, c(0.1 + 0.1 + 0,
                          0.1 + 0,
                          0.15 + 0,
                          0.1 + 0.1 + 0.15 + 0))
  expect_equal(ss$obj,
              (ss$F1 * 100) + (ss$F2 * 4) + (ss$F3[1] * 9) +
              (ss$F1 * 5) +  (ss$F2 * 5) +  (ss$F3 * 5) +
              ((1 - (1 - ss$F1) * (1 - ss$F2)) * 100))
  expect_equal(ss$F1, c(0.95 * 0.91,
                        0.1 * 1,
                        0.94 * 0.8,
                        0.95 * 0.91))
  expect_equal(ss$F2, c(0.96 * 0.92,
                        0.96 * 0.92,
                        0.94 * 0.8,
                        0.96 * 0.92))
  expect_equal(ss$F3, c(0.1 * 1,
                        0.1 * 1,
                        0.1 * 1,
                        0.1 * 1))
})
