context("Utilities")

test_that("Argument validation works", {
  good_list <- list(dog = "lucy", cat = "felix", bird = "charlie parker")
  expect_true(all(validateArguments(good_list, list(dog = "lucy", cat = "felix"))))
  expect_error(validateArguments(good_list, list(hello = "world")),
               "Arguments are missing from valid list: hello$")
  expect_error(validateArguments(good_list, list("world")), "Invalid arguments. Lists must be named")
  expect_error(validateArguments(good_list, c(hello = "world")), 
               regexp = "Invalid arguments. Both the args to be checked and the valid args to check against must be of class list")
})

test_that("Response booleans", {
  expect_true(isSuccessfulResponse(response_list$success))
  expect_false(isSuccessfulResponse(response_list$empty))
  expect_false(isSuccessfulResponse(response_list$error))
  
  expect_true(isEmptyResponse(response_list$empty))
  expect_false(isEmptyResponse(response_list$success))
  expect_false(isEmptyResponse(response_list$error))
  
  expect_true(isErrorResponse(response_list$error))
  expect_false(isErrorResponse(response_list$success))
  expect_false(isErrorResponse(response_list$empty))
})

test_that("Parsing response returns correct class and data types", {
  for(response in response_list[c("ts_success", "success", "intraday_success")]) {
    parsed_object <- parseResponse(response)
    expect_equal(class(parsed_object), "list")
    expect_equal(names(parsed_object), c("xts_object", "httr_response"))
    expect_true("xts" %in% class(parsed_object[["xts_object"]]))
    expect_true(all(apply(parsed_object[["xts_object"]], 2, class) == "numeric"))
  }
})
