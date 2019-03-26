
context("mark_my_file")

test_that(desc="mark_my_file()",{
  source_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  assignment_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")

  remove_assignment()
  expect_error(x <- capture.output(y <- mark_my_assignment()))
  
  x <- capture.output(y <- mark_my_file(mark_file = source_file, assignment_path = assignment_file, quiet = TRUE))
  expect_is(y, "testthat_results")
  
  x <- capture.output(y <- mark_my_file(mark_file = file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R"), assignment_path = assignment_file, quiet = TRUE))
  expect_is(y, "testthat_results")
  
  expect_warning(x <- capture_output(expect_is(mark_my_file(mark_file = file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file_messy.R"), assignment_path = assignment_file, quiet = TRUE), "testthat_results")))
  expect_is(capture.output(mark_my_file(mark_file = source_file, assignment_path = assignment_file)), "character")

  x <- capture.output(y <- mark_my_file(tasks = "task1", mark_file = source_file, assignment_path = assignment_file, quiet = TRUE))
  expect_is(y, "testthat_results")
  expect_equal(length(y), 2)  
  
  x <- capture.output(y <- mark_my_file(tasks = c("task1", "task2"), mark_file = source_file, assignment_path = assignment_file, quiet = TRUE))
  expect_is(y, "testthat_results")
  
  expect_warning(x <- capture.output(y <- mark_my_file(mark_file = source_file, assignment_path = assignment_file, force_get_tests = TRUE, quiet = TRUE)))
  expect_is(y, "testthat_results")
  
})


test_that(desc="Assertions on arguments in mark_my_file()",{
  source_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  assignment_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  
  expect_error(capture.output(mark_my_file(tasks = "no such task", mark_file = source_file, assignment_path = assignment_file, quiet = TRUE)))
  expect_error(mark_my_file(mark_file = source_file, assignment_path = assignment_file, tasks = task2, quiet = TRUE))
  expect_error(mark_my_file(mark_file = source_file, assignment_path = "~/no such directory/no such file.yml", quiet = TRUE))
  expect_error(mark_my_file(quiet = "TRUE", mark_file = source_file, assignment_path = assignment_file))
  expect_error(mark_my_file(force_get_tests = "TRUE", mark_file = source_file, assignment_path = assignment_file))
  expect_error(mark_my_file(mark_file = "~/no such directory/no such file.R"))
})


test_that(desc="Load packages before",{
  source_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  assignment_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment08_bad_pkgs.yml")
  expect_warning(capture.output(mark_my_file(mark_file = source_file, assignment_path = assignment_file)), regexp = "The following packages need to be installed and then loaded")

  assignment_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment07_pkgs.yml")
  expect_warning(capture.output(mark_my_file(mark_file = source_file, assignment_path = assignment_file)), regexp = "The following packages should be loaded")
  library(codetools)
  expect_silent(capture.output(mark_my_file(mark_file = source_file, assignment_path = assignment_file)))
  detach(name = "package:codetools")
  expect_warning(capture.output(mark_my_file(mark_file = source_file, assignment_path = assignment_file)), regexp = "The following packages should be loaded")
  }
)

test_that(desc="additional tests",{
  assignment_path <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  suppressMessages(set_assignment(assignment_path))
  lab_file_path <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  
  expect_silent(x <- capture.output(y <- mark_my_file(mark_file = lab_file_path)))
  x <- capture.output(fails <- print(y)$failed)
  expect_equal(sum(fails), 0)
  expect_silent(capture.output(mark_my_file(mark_file = lab_file_path, reporter = "summary")))
  expect_error(capture.output(mark_my_file(mark_file = lab_file_path, reporter = "non_existing_reporter")))
  
  expect_warning(x <- capture.output(y <- mark_my_file(mark_file = lab_file_path, force_get_tests = TRUE)), regexp = "Deprecated")
  expect_silent(x <- capture.output(y <- mark_my_file(mark_file = lab_file_path, quiet = TRUE)))
  expect_length(x, 0)
  
  # Check that global environment does not pollute
  source(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file_errors.R"))
  expect_silent(x <- capture.output(y <- mark_my_file(mark_file = lab_file_path)))
  x <- capture.output(fails <- print(y)$failed)
  expect_equal(sum(fails), 0)
  
  expect_silent(x <- capture.output(y <- mark_my_assignment()))
  x <- capture.output(fails <- print(y)$failed)
  expect_equal(sum(fails), 4)
  
  remove_assignment()
  expect_silent(x <- capture.output(y <- mark_my_file(mark_file = lab_file_path, assignment_path = assignment_path)))
  x <- capture.output(fails <- print(y)$failed)
  expect_equal(sum(fails), 0)
  expect_error(show_tasks(), regexp = "No assignment has been set")
})

