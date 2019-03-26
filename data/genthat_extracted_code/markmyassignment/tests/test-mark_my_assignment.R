
context("mark_my_assignment")

test_that(desc="mark_my_assignment()",{
  suppressWarnings(suppressMessages(set_assignment(path = file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml"))))
  source(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R"))
  
  expect_is(capture.output(mark_my_assignment()), "character")
  expect_silent(capture.output(mark_my_assignment(reporter = "summary")))
  expect_error(capture.output(mark_my_assignment(reporter = "non_existing_reporter")))

  x <- capture.output(y <- mark_my_assignment(quiet = TRUE))
  expect_is(y, "testthat_results")
  expect_equal(length(y), 4)
  expect_length(x, 0)
  
  x <- capture.output(y <- mark_my_assignment(tasks = "task1"))
  expect_is(y, "testthat_results")
  expect_equal(length(y), 2)

  x <- capture.output(y <- mark_my_assignment(tasks = c("task1", "task2"), quiet = TRUE))  
  expect_is(y, "testthat_results")
  expect_equal(length(y), 4)
  expect_length(x, 0)
  
  x <- expect_warning(capture.output(y <- mark_my_assignment(force_get_tests = TRUE, quiet = TRUE)))
  expect_is(y, "testthat_results")
  
  expect_warning(x <- capture.output(mark_my_assignment(mark_file = file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R"))))

  source(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file_errors.R"))
  expect_silent(capture.output(y <- mark_my_assignment()))
  expect_equal(length(y), 4)
  
  suppressMessages(set_assignment(file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")))
  source(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R"))
  expect_silent(capture.output(y <- mark_my_assignment()))
  expect_equal(length(y), 4)
})


test_that(desc="run_code",{
  suppressWarnings(suppressMessages(set_assignment(file.path(system.file(package = "markmyassignment"), "extdata/example_assignment09.yml"))))
  source(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R"))
  
  expect_is(x <- capture.output(mark_my_assignment()), "character")
  expect_true(any(grepl(x,  pattern = "This is run after")))
  expect_true(any(grepl(x,  pattern = "This is run before 1")))
  expect_true(any(grepl(x,  pattern = "This is run before 2")))
  expect_lt(which(grepl(x,  pattern = "This is run before 1")), which(grepl(x,  pattern = "This is run after")))

  suppressWarnings(suppressMessages(set_assignment(file.path(system.file(package = "markmyassignment"), "extdata/example_assignment09a.yml"))))
  expect_is(x <- capture.output(mark_my_assignment()), "character")
  expect_true(any(grepl(x,  pattern = "This is run after")))
  expect_false(any(grepl(x,  pattern = "This is run before 1")))
  
  suppressWarnings(suppressMessages(set_assignment(file.path(system.file(package = "markmyassignment"), "extdata/example_assignment09b.yml"))))
  expect_is(x <- capture.output(mark_my_assignment()), "character")
  expect_false(any(grepl(x,  pattern = "This is run after")))
  expect_true(any(grepl(x,  pattern = "This is run before 1")))

})



test_that(desc="Assertions on arguments mark_my_assignment()",{
  
  suppressMessages(set_assignment(file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")))
  lab_file_path <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  source(lab_file_path)
  
  expect_error(capture.output(mark_my_assignment(tasks = "no such task")), regexp = "tasks")
  expect_error(capture.output(mark_my_assignment(tasks = c("task1", "no such task", "task2"))), regexp = "tasks")
  
  expect_error(mark_my_assignment(tasks = task2, quiet = TRUE))
  expect_error(mark_my_assignment(quiet = "TRUE"))
  expect_error(mark_my_assignment(force_get_tests = "TRUE"))
  
  expect_warning(capture.output(mark_my_assignment(force_get_tests = TRUE)), regexp = "Deprecated")
  expect_warning(capture.output(mark_my_assignment(mark_file = lab_file_path)), regexp = "Deprecated")
  
})


test_that(desc="delete_circular_calls()",{
  expect_warning(delete_circular_calls(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file_circular.R")))
  expect_silent(delete_circular_calls(file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")))
})

