context("add_feature_weights")

test_that("numeric(5)", {
  # load data
  data(sim_projects, sim_actions, sim_features)
  # create problem
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_feature_weights(seq_len(5))
  # calculate weights
  weights <- p$feature_weights()
  # run tests
  expect_is(weights, "numeric")
  expect_equal(weights, setNames(seq_len(5), sim_features$name))
})

test_that("character(1)", {
  # load data
  data(sim_projects, sim_actions, sim_features)
  # create problem
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_feature_weights("weight")
  # calculate weights
  weights <- p$feature_weights()
  # run tests
  expect_is(weights, "numeric")
  expect_equal(weights, setNames(sim_features$weight, sim_features$name))
})

test_that("invalid arguments", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE)
  ## single numeric values
  expect_error({
    add_feature_weights(p, 2)
  })
  expect_error({
    add_feature_weights(p, -1)
  })
  expect_error({
    add_feature_weights(p, NA_real_)
  })
  ## multiple numeric values
  expect_error({
    add_feature_weights(p, rep(0.1, nrow(sim_features) - 1))
  })
  expect_error({
    add_feature_weights(p, c(NA_real_, rep(0.1, nrow(sim_features) - 1)))
  })
  ## character values
  expect_error({
    add_feature_weights(p, NA_character_)
  })
  expect_error({
    add_feature_weights(p, "a")
  })
  expect_error({
    add_feature_weights(p, c("weight", "weight"))
  })
})
