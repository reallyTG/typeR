context("Test whether create_qsub_config works")

test_that("create_qsub_config works", {
  qsub_config <- create_qsub_config(
    # server settings
    remote = "for.several@centuries.prior.to",
    local_tmp_path = "/the/great/persian",
    remote_tmp_path = "/invasions/of/greece",

    # execution parameters
    name = "perhaps_the_very_greatest_and_wealthiest",
    num_cores = 4,
    memory = "101G",
    max_running_tasks = 101,
    max_wall_time = "00:00:01",
    batch_tasks = 10,

    # pre-execution parameters
    modules = c("city", "of", "the", "greek"),
    execute_before = "./world_was_miletus.sh 'situate about the centre'",
    verbose = FALSE,

    # post-execution parameters
    wait = FALSE,
    remove_tmp_folder = FALSE,
    stop_on_error = FALSE
  )

  expect_equal(qsub_config$remote, "for.several@centuries.prior.to")
  expect_equal(qsub_config$local_tmp_path, "/the/great/persian")
  expect_equal(qsub_config$remote_tmp_path, "/invasions/of/greece")
  expect_equal(qsub_config$name, "perhaps_the_very_greatest_and_wealthiest")
  expect_equal(qsub_config$num_cores, 4)
  expect_equal(qsub_config$memory, "101G")
  expect_equal(qsub_config$max_running_tasks, 101)
  expect_equal(qsub_config$max_wall_time, "00:00:01")
  expect_equal(qsub_config$batch_tasks, 10)
  expect_equal(qsub_config$modules, c("city", "of", "the", "greek"))
  expect_equal(qsub_config$execute_before, "./world_was_miletus.sh 'situate about the centre'")
  expect_equal(qsub_config$verbose, FALSE)
  expect_equal(qsub_config$wait, FALSE)
  expect_equal(qsub_config$remove_tmp_folder, FALSE)
  expect_equal(qsub_config$stop_on_error, FALSE)

  qsub_config <- create_qsub_config(
    # server settings
    remote = "of.the.ionian@coasts.of.asia",
    local_tmp_path = "/minor/with/four",
    remote_tmp_path = "/magnificent/harbours/and/a",

    # execution parameters
    name = "strongly_defensible_position",
    num_cores = 5,
    memory = "62G",
    max_running_tasks = 65,
    max_wall_time = "00:00:23",
    batch_tasks = 4,

    # pre-execution parameters
    modules = c("it", "gathered", "to"),
    execute_before = "./itself.sh much of the great overland trade",
    verbose = TRUE,

    # post-execution parameters
    wait = FALSE,
    remove_tmp_folder = TRUE,
    stop_on_error = FALSE
  )

  expect_equal(qsub_config$remote, "of.the.ionian@coasts.of.asia")
  expect_equal(qsub_config$local_tmp_path, "/minor/with/four")
  expect_equal(qsub_config$remote_tmp_path, "/magnificent/harbours/and/a")
  expect_equal(qsub_config$name, "strongly_defensible_position")
  expect_equal(qsub_config$num_cores, 5)
  expect_equal(qsub_config$memory, "62G")
  expect_equal(qsub_config$max_running_tasks, 65)
  expect_equal(qsub_config$max_wall_time, "00:00:23")
  expect_equal(qsub_config$batch_tasks, 4)
  expect_equal(qsub_config$modules, c("it", "gathered", "to"))
  expect_equal(qsub_config$execute_before, "./itself.sh much of the great overland trade")
  expect_equal(qsub_config$verbose, TRUE)
  expect_equal(qsub_config$wait, FALSE)
  expect_equal(qsub_config$remove_tmp_folder, TRUE)
  expect_equal(qsub_config$stop_on_error, FALSE)
})
