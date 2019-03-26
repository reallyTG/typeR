context("problem")

test_that("valid arguments (include_baseline = FALSE)", {
  # data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE)
  # tests
  ## display methods
  expect_is(print(p), "NULL")
  expect_is(show(p), "NULL")
  expect_equal(p$repr(), "ProjectProblem object")
  ## getters
  expect_equal(p$get_data("projects"), sim_projects)
  expect_equal(p$get_data("actions"), sim_actions)
  expect_equal(p$get_data("features"), sim_features)
  expect_equal(p$get_data("project_name_column"), "name")
  expect_equal(p$get_data("project_success_column"), "success")
  expect_equal(p$get_data("action_name_column"), "name")
  expect_equal(p$get_data("action_cost_column"), "cost")
  expect_equal(p$get_data("feature_name_column"), "name")
  expect_equal(number_of_projects(p), nrow(sim_projects))
  expect_equal(number_of_actions(p), nrow(sim_actions))
  expect_equal(number_of_features(p), nrow(sim_features))
  expect_equal(project_names(p), sim_projects$name)
  expect_equal(action_names(p), sim_actions$name)
  expect_equal(feature_names(p), sim_features$name)
  expect_equal(p$action_costs(), setNames(sim_actions$cost, sim_actions$name))
  expect_equal(p$project_success_probabilities(),
               setNames(sim_projects$success, sim_projects$name))
  expect_true(all(p$pf_matrix() ==
                  as(as.matrix(sim_projects[, sim_features$name]),
                     "dgCMatrix"),
                  na.rm = TRUE))
  expect_equal(rownames(p$pf_matrix()), sim_projects$name)
  expect_equal(colnames(p$pf_matrix()), sim_features$name)
  expect_true(all(p$epf_matrix() ==
                  as(
                    as.matrix(sim_projects[, sim_features$name]) *
                    matrix(p$project_success_probabilities(),
                           ncol = p$number_of_features(),
                           nrow = p$number_of_projects()),
                     "dgCMatrix"),
                  na.rm = TRUE))
  expect_equal(rownames(p$epf_matrix()), sim_projects$name)
  expect_equal(colnames(p$epf_matrix()), sim_features$name)
  expect_true(all(p$pa_matrix() ==
                  as(as.matrix(sim_projects[, sim_actions$name]), "dgCMatrix")))
  expect_equal(rownames(p$pa_matrix()), sim_projects$name)
  expect_equal(colnames(p$pa_matrix()), sim_actions$name)
  expect_error(p$feature_targets())
  ## setters
  p$set_data("feature_name_column", "test")
  expect_equal(p$get_data("feature_name_column"), "test")
  p$set_data("feature_name_column", "name")
})

test_that("valid arguments (include_baseline = TRUE)", {
  # data
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", TRUE)
  # tests
  ## display methods
  expect_is(print(p), "NULL")
  expect_is(show(p), "NULL")
  expect_equal(p$repr(), "ProjectProblem object")
  ## getters
  expect_equal(p$get_data("projects"), sim_projects)
  expect_equal(p$get_data("actions"), sim_actions)
  expect_equal(p$get_data("features"), sim_features)
  expect_equal(p$get_data("project_name_column"), "name")
  expect_equal(p$get_data("project_success_column"), "success")
  expect_equal(p$get_data("action_name_column"), "name")
  expect_equal(p$get_data("action_cost_column"), "cost")
  expect_equal(p$get_data("feature_name_column"), "name")
  expect_equal(number_of_projects(p), nrow(sim_projects))
  expect_equal(number_of_actions(p), nrow(sim_actions))
  expect_equal(number_of_features(p), nrow(sim_features))
  expect_equal(project_names(p), sim_projects$name)
  expect_equal(action_names(p), sim_actions$name)
  expect_equal(feature_names(p), sim_features$name)
  expect_equal(p$action_costs(), setNames(sim_actions$cost, sim_actions$name))
  expect_equal(p$project_success_probabilities(),
               setNames(sim_projects$success, sim_projects$name))
  expect_true(all(p$pf_matrix() ==
                  as(as.matrix(sim_projects[, sim_features$name]),
                     "dgCMatrix"),
                  na.rm = TRUE))
  expect_equal(rownames(p$pf_matrix()), sim_projects$name)
  expect_equal(colnames(p$pf_matrix()), sim_features$name)
  sim_epf_matrix <-
    as(as.matrix(sim_projects[, sim_features$name]) *
      matrix(p$project_success_probabilities(),
             ncol = p$number_of_features(),
             nrow = p$number_of_projects()),
       "dgCMatrix")
  for (i in seq_len(ncol(sim_epf_matrix))) {
    j <- which(sim_epf_matrix[-nrow(sim_epf_matrix), i] > 1e-10)
    curr_p <- sim_epf_matrix[j, i]
    curr_bp <- sim_epf_matrix[nrow(sim_epf_matrix), i]
    curr_p <- curr_p + ((1 - curr_p) * curr_bp)
    sim_epf_matrix[j, i] <- curr_p
  }
  expect_true(all(p$epf_matrix() == sim_epf_matrix, na.rm = TRUE))
  expect_equal(rownames(p$epf_matrix()), sim_projects$name)
  expect_equal(colnames(p$epf_matrix()), sim_features$name)
  expect_true(all(p$pa_matrix() ==
                  as(as.matrix(sim_projects[, sim_actions$name]), "dgCMatrix")))
  expect_equal(rownames(p$pa_matrix()), sim_projects$name)
  expect_equal(colnames(p$pa_matrix()), sim_actions$name)
  expect_error(p$feature_targets())
  ## setters
  p$set_data("feature_name_column", "test")
  expect_equal(p$get_data("feature_name_column"), "test")
  p$set_data("feature_name_column", "name")
})

test_that("invalid arguments", {
  # verify that function works using built-in dataset
  data(sim_projects, sim_actions, sim_features)
  expect_is(problem(sim_projects, sim_actions, sim_features,
                    "name", "success", "name", "cost", "name"),
                    "ProjectProblem")
  # invalid names
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects, sim_actions, sim_features,
            "name1", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success1", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name1", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost1", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name1")
  })
  # invalid success
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$success[1] <- NA_real_
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$success[1] <- -1
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$success[1] <- 2
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$success <- as.character(sim_projects$success)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  # invalid costs
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_actions$cost[1] <- NA_real_
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_actions$cost[1] <- -5
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_actions$cost <- "2"
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  # invalid species probabilities
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$F1[1] <- NA_real_
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$F1[1] <- -1
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$F1[1] <- 2
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects$F1 <- as.character(sim_projects$F1)
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects[, -3], sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    problem(sim_projects[, -8], sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  # feature columns
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_features$name[1] <- NA_character_
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_features$name <- 5
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_features$name <- TRUE
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects[nrow(sim_projects), sim_features$name[1]] <- 1e-12
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
  expect_error({
    data(sim_projects, sim_actions, sim_features)
    sim_projects[nrow(sim_projects), sim_features$name[1]] <- NA_real_
    problem(sim_projects, sim_actions, sim_features,
            "name", "success", "name", "cost", "name")
  })
})
