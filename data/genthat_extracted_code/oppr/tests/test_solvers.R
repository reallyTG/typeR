context("solvers")

test_that("add_default_solver (simulated data)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # make data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_min_set_objective() %>%
       add_relative_targets(0.5) %>%
       add_binary_decisions() %>%
       add_default_solver()
  s <- solve(p)
  # check that solution has correct properties
  expect_true(inherits(s, "tbl_df"))
  expect_equal(nrow(s), 1)
  expect_gt(ncol(s), 0)
})

test_that("add_default_solver (simple problem)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name") %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_default_solver() %>%
       solve()
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("add_rsymphony_solver (simulated data)", {
  skip_on_cran()
  skip_if_not_installed("Rsymphony")
  # make data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_min_set_objective() %>%
       add_relative_targets(0.5) %>%
       add_binary_decisions() %>%
       add_rsymphony_solver()
  s <- solve(p)
  # check that solution has correct properties
  expect_true(inherits(s, "tbl_df"))
  expect_equal(nrow(s), 1)
  expect_gt(ncol(s), 0)
})

test_that("add_rsymphony_solver (simple problem)", {
  skip_on_cran()
  skip_if_not_installed("Rsymphony")
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name") %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_rsymphony_solver() %>%
       solve()
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("add_lpsymphony_solver (simulated data)", {
  skip_on_cran()
  skip_if_not_installed("lpsymphony")
  skip_on_os("linux") # lpsymphony package crashes unpredictably on Ubuntu 16.04
  # make data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_min_set_objective() %>%
       add_relative_targets(0.5) %>%
       add_binary_decisions() %>%
       add_lpsymphony_solver()
  s <- solve(p)
  # check that solution has correct properties
  expect_true(inherits(s, "tbl_df"))
  expect_equal(nrow(s), 1)
  expect_gt(ncol(s), 0)
})

test_that("add_lpsymphony_solver (simple problem)", {
  skip_on_cran()
  skip_if_not_installed("lpsymphony")
  skip_on_os("linux") # lpsymphony package crashes unpredictably on Ubuntu 16.04
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name") %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_lpsymphony_solver() %>%
       solve()
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("add_gurobi_solver", {
  skip_on_cran()
  skip_if_not_installed("gurobi")
  # make data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_min_set_objective() %>%
       add_relative_targets(0.5) %>%
       add_binary_decisions() %>%
       add_gurobi_solver()
  s <- solve(p)
  # check that solution has correct properties
  expect_true(inherits(s, "tbl_df"))
  expect_equal(nrow(s), 1)
  expect_gt(ncol(s), 0)
})

test_that("add_gurobi_solver (simple problem)", {
  skip_on_cran()
  skip_if_not_installed("gurobi")
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name") %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_gurobi_solver() %>%
       solve()
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("add_lpsolveapi_solver", {
  skip_on_cran()
  skip_if_not_installed("lpSolveAPI")
  # make data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_min_set_objective() %>%
       add_relative_targets(0.5) %>%
       add_binary_decisions() %>%
       add_lpsolveapi_solver()
  s <- solve(p)
  # check that solution has correct properties
  expect_true(inherits(s, "tbl_df"))
  expect_equal(nrow(s), 1)
  expect_gt(ncol(s), 0)
})

test_that("add_lpsolveapi_solver (simple problem)", {
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  s <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name") %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_lpsolveapi_solver() %>%
       solve()
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})
