context("project cost-effectiveness")

test_that("valid arguments", {
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
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions()
  # calculate project cost-effectiveness
  o <- project_cost_effectiveness(p)
  # tests
  expect_is(o, "tbl_df")
  expect_equal(o$project, p$project_names())
  expect_equal(o$cost, c(0.1, 0.1, 0.15, 0))
  expect_equal(o$obj, c(((0.95 * 0.91) + 0.2),
                            ((0.96 * 0.92) + 0.2),
                            ((0.94 * 0.8) + (0.94 * 0.8) + 0.1),
                            0.3))
  ce <- c((o$obj - 0.3) / o$cost)
  ce[!is.finite(ce)] <- NaN
  expect_equal(o$benefit, o$obj - 0.3)
  expect_equal(o$ce, ce)
  expect_equal(o$rank, c(3, 2, 1, 4))
})

test_that("valid arguments (different number of actions/projects", {
  # create data
  projects <- tibble::tibble(name = c("P1", "P2"),
                             success =  c(0.95, 1.00),
                             F1 =       c(0.91, 0.10),
                             F2 =       c(0.00, 0.10),
                             F3 =       c(0.00, 0.10),
                             A1 =       c(TRUE, FALSE),
                             A2 =       c(TRUE, FALSE),
                             A3 =       c(TRUE, FALSE),
                             A4 =       c(FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions()
  # calculate project cost-effectiveness
  o <- project_cost_effectiveness(p)
  # tests
  expect_is(o, "tbl_df")
  expect_equal(o$project, p$project_names())
  expect_equal(o$cost, c(0.35, 0))
  expect_equal(o$obj, c((0.95 * 0.91) + 0.2, 0.3))
  ce <- c((o$obj - 0.3) / o$cost)
  ce[!is.finite(ce)] <- NaN
  expect_equal(o$benefit, o$obj - 0.3)
  expect_equal(o$ce, ce)
  expect_equal(o$rank, c(1, 2))
})

test_that("invalid arguments", {
  data(sim_projects, sim_actions, sim_features)
  expect_error({
    problem(sim_projects, sim_actions, sim_features, "name",
            "success", "name", "cost", "name") %>%
    project_cost_effectiveness()
  })
  expect_error({
    problem(sim_projects, sim_actions, sim_features, "name",
            "success", "name", "cost", "name") %>%
    add_minimum_set_objective() %>%
    project_cost_effectiveness()
  })
})
