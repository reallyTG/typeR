context("add_manual_targets")

test_that("valid arguments", {
  # load data
  data(sim_projects, sim_actions, sim_features)
  # create problem
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE) %>%
       add_manual_targets(data.frame(feature = sim_features$name[seq_len(4)],
                                     target = seq_len(4) * 0.1,
                                     type = "absolute"))
  # calculate absolute targets
  targets <- p$targets$output()
  # run tests
  expect_is(targets, "tbl_df")
  expect_true(all(names(targets) == c("feature", "sense", "value")))
  expect_is(targets$feature, "integer")
  expect_is(targets$value, "numeric")
  expect_is(targets$sense, "character")
  expect_equal(targets$feature, seq_len(nrow(sim_features)))
  expect_equal(targets$value, c(seq_len(4) * 0.1, -1))
  expect_equal(targets$sense, rep(">=", nrow(sim_features)))
})

test_that("invalid arguments", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE)
  # tests
  ## empty data.frame
  expect_error({
    add_manual_targets(p, data.frame())
  })
  ## missing columns
  expect_error({
    add_manual_targets(p, data.frame(
      type = "absolute",
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "absolute"))
  })
  ## invalid feature column
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "a",
      type = "absolute",
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = NA_character_,
      type = "absolute",
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = 1,
      type = "absolute",
      target = 0.5))
  })
  ## invalid type column
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "g",
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = NA_character_,
      target = 0.5))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = 1,
      target = 0.5))
  })
  ## invalid target column
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "absolute",
      target = 2))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "absolute",
      target = -1))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "absolute",
      target = NA_real_))
  })
  expect_error({
    add_manual_targets(p, data.frame(
      feature = "F1",
      type = "absolute",
      target = "1"))
  })
})
