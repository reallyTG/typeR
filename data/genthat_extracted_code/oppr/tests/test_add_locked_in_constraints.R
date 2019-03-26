context("add_locked_in_constraints")

test_that("integer (compile)", {
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1) %>%
       add_locked_in_constraints(which(sim_actions$locked_in))
  # compile problem
  o <- compile(p)
  # check that constraints added correctly
  expect_equal(o$lb(), replace(rep(0, nrow(sim_actions) + nrow(sim_projects) +
                                      (nrow(sim_projects) *
                                       nrow(sim_features)) +
                                      nrow(sim_features)),
                               which(sim_actions$locked_in), 1))
})

test_that("integer (solve)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1e+5) %>%
       add_locked_in_constraints(which(sim_actions$locked_in))
  # solve problem
  s <- solve(p)
  # check solution
  for (i in sim_actions$name[sim_actions$locked_in])
    expect_equal(s[[i]], 1)
})

test_that("integer (invalid arguments)", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1)
  expect_error({
    add_locked_in_constraints(p, -1)
  })
  expect_error({
    add_locked_in_constraints(p, 0)
  })
  expect_error({
    add_locked_in_constraints(p, nrow(sim_actions) + 1)
  })
  expect_error({
    add_locked_in_constraints(p, NA_real_)
  })
})

test_that("logical (compile)", {
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1) %>%
       add_locked_in_constraints(sim_actions$locked_in)
  # compile problem
  o <- compile(p)
  # check that constraints added correctly
  expect_equal(o$lb(), replace(rep(0, nrow(sim_actions) + nrow(sim_projects) +
                                      (nrow(sim_projects) *
                                       nrow(sim_features)) +
                                      nrow(sim_features)),
                               which(sim_actions$locked_in), 1))
})

test_that("logical (invalid arguments)", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1)
  expect_error({
    add_locked_in_constraints(p, FALSE)
  })
  expect_error({
    add_locked_in_constraints(p, c(TRUE, TRUE))
  })
  expect_error({
    add_locked_in_constraints(p, NA)
  })
})

test_that("logical (solve)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1e+5) %>%
       add_locked_in_constraints(sim_actions$locked_in)
  # solve problem
  s <- solve(p)
  # check solution
  for (i in sim_actions$name[sim_actions$locked_in])
    expect_equal(s[[i]], 1)
})

test_that("character (compile)", {
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1) %>%
       add_locked_in_constraints("locked_in")
  # compile problem
  o <- compile(p)
  # check that constraints added correctly
  expect_equal(o$lb(), replace(rep(0, nrow(sim_actions) + nrow(sim_projects) +
                                      (nrow(sim_projects) *
                                       nrow(sim_features)) +
                                      nrow(sim_features)),
                               which(sim_actions$locked_in), 1))
})

test_that("logical (invalid arguments)", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1)
  expect_error({
    add_locked_in_constraints(p, "name")
  })
  expect_error({
    add_locked_in_constraints(p, "column_that_doesnt_exist")
  })
  expect_error({
    add_locked_in_constraints(p, NA_character_)
  })
})

test_that("character (solve)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # create problem
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_max_richness_objective(1e+5) %>%
       add_locked_in_constraints("locked_in")
  # solve problem
  s <- solve(p)
  # check solution
  for (i in sim_actions$name[sim_actions$locked_in])
    expect_equal(s[[i]], 1)
})
