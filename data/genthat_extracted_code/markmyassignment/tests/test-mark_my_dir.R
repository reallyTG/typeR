
context("mark_my_dir")


test_that(desc="mark_my_dir()",{
  test_assgn_file <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  test_dir <- file.path(system.file(package = "markmyassignment"), "extdata/example_dir")
  expect_message(x <- capture_output(res_mark <- mark_my_dir(directory = test_dir, assignment_path = test_assgn_file)))
  expect_is(res_mark, class = "list")
  expect_equal(length(res_mark), 3)
  expect_is(res_mark[[1]], class = "testthat_results")
  
  expect_warning(x <- capture_output(res_mark <- mark_my_dir(directory = test_dir, assignment_path = test_assgn_file, force_get_tests = TRUE)), "Deprecated")
})

