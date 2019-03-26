context("replacement-lists")

list <- list(dv = "dv", id = "id", idv = "idv", pred = "pred")    
replacement <- list(idv = "time", dv = "conc")
bad_replacement <- list(notitem = "time", dv = "conc")
correct_output <- list(dv = "conc", id = "id", idv = "time", pred = "pred")
correct_bad_output <- list(dv = "conc", id = "id", idv = "idv", pred = "pred", notitem = "time")

test_that("list elements replaced properly", {
  expect_equal(replace_list_elements(list, replacement), correct_output)
  expect_error(replace_list_elements(list, bad_replacement, add = FALSE))
  expect_equal(suppressWarnings(replace_list_elements(list, bad_replacement)), correct_bad_output)
  expect_equal(replace_list_elements(list, list()), list)
})

test_that("expectation warns user if named replacement not found in original list", {
  expect_warning(replace_list_elements(list, bad_replacement), 
               "Nothing named:  notitem found to replace")
})