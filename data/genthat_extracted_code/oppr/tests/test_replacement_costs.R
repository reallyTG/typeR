context("replacement costs")

test_that("maximum obj", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # make data
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
  # create problem, solution, output
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.26) %>%
       add_binary_decisions()
  s <- data.frame(A1 = 1, A2 = 0, A3 = 1, A4 = 1)
  r <- replacement_costs(p, s)
  # tests
  expect_is(r, "tbl_df")
  expect_equal(nrow(r), 4)
  expect_equal(r$name, p$action_names())
  expect_equal(r$cost, c(0.25, NA_real_, 0.2, Inf))
  expect_equal(r$obj, c((0.94 * 0.8) + (0.96 * 0.92) + (1.0 * 0.1),
                         NA_real_,
                         (0.91 * 0.95) + (0.96 * 0.92) + (1.0 * 0.1),
                         Inf))
  expect_equal(r$rep_cost, ((0.91 * 0.95) +
                            (0.94 * 0.8) +
                            (1.0 * 0.1)) - r$obj)
})

test_that("minimum obj", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # make data
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
                             target = c(0.2, 0.2, 0.05))
  # create problem, solution, output
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_min_set_objective() %>%
       add_absolute_targets("target") %>%
       add_binary_decisions()
  s <- data.frame(A1 = 1, A2 = 0, A3 = 1, A4 = 1)
  r <- replacement_costs(p, s)
  # tests
  expect_is(r, "tbl_df")
  expect_equal(nrow(r), 4)
  expect_equal(r$name, p$action_names())
  expect_equal(r$cost, c(0.15, NA_real_, 0.2, Inf))
  expect_equal(r$obj, c(0.15, NA_real_, 0.2, Inf))
  expect_equal(r$rep_cost, r$obj - 0.25)
})

test_that("invalid arguments", {
  # initialize test data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features, "name", "success",
               "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(0.16) %>%
       add_binary_decisions()
  solution <- as.data.frame(matrix(rep(1, p$number_of_actions()), nrow = 1,
                                   dimnames = list(NULL, p$action_names())))
  # verify that test data yields plot
  if (identical(Sys.getenv("NOT_CRAN"), "true"))
    expect_is(replacement_costs(p, solution), "tbl_df")
  # invalid problem
  expect_error({
    replacement_costs(
      problem(sim_projects, sim_actions, sim_features, "name",  "success",
              "name", "cost", "name"), solution)
  })
  # invalid solution
  expect_error({
    replacement_costs(p, as.matrix(solution))
  })
  expect_error({
    s <- solution
    s[[1]] <- NA_real_
    replacement_costs(p, s)
  })
  expect_error({
    s <- solution
    s[[1]] <- "a"
    replacement_costs(p, s)
  })
  expect_error({
    s <- solution
    replacement_costs(p, solution[, -1, drop = FALSE])
  })
  # invalid n
  expect_error({
    replacement_costs(p, solution, NA_integer_)
  })
  expect_error({
    replacement_costs(p, solution, "a")
  })
  expect_error({
    replacement_costs(p, solution, TRUE)
  })
})
