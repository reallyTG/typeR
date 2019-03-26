context("Tool: User-defined tool")
# Test create_example_func
#      create_usrtool
#

test_that("create_example_func", {

  func <- create_example_func()
  expect_true(is.function(func))
  expect_equal(names(formals(func)), "single_testset")

})

test_that("create_usrtool - tool_name", {
  func <- create_example_func()

  expect_error(create_usrtool("xyz", func), NA)

  expect_error(create_usrtool(1, func), "tool_name is not a string")
  expect_error(create_usrtool(c("xyz", "A"), func), "tool_name is not a string")
})

test_that("create_usrtool - func", {
  func <- create_example_func()

  expect_error(create_usrtool("xyz", func), NA)

  expect_error(create_usrtool("xyz", "A"), "func is not a function")
  expect_error(create_usrtool("xyz", function() NULL), "Invalid func")
  expect_error(create_usrtool("xyz", function(x) stop("s")), "Invalid func")
  expect_error(create_usrtool("xyz", function(x) list(1, 2, 3)), "Invalid func")
  expect_error(create_usrtool("xyz", function(x) list(x = 1,  y = 2, 3)),
               "Invalid func")
})

test_that("create_usrtool - R6", {
  func <- create_example_func()
  tool1 <- create_usrtool("xyz", func)[[1]]

  expect_true(is(tool1, "Toolxyz"))
  expect_true(is(tool1, "ToolIFBase"))
  expect_true(is(tool1, "R6"))
})

test_that("create_usrtool: calc_auc", {
  func <- create_example_func()

  expect_error(create_usrtool("xyz", func, calc_auc = TRUE), NA)
  expect_error(create_usrtool("xyz", func, calc_auc = FALSE), NA)

  expect_error(create_usrtool("xyz", func, calc_auc = 1),
               "calc_auc is not a flag")
  expect_error(create_usrtool("xyz", func, calc_auc = "TRUE"),
               "calc_auc is not a flag")

  tool1 <- create_usrtool("xyz", func)[[1]]
  expect_equal(environment(tool1$clone)$private$def_calc_auc, TRUE)

  tool2 <- create_usrtool("xyz", func, calc_auc = FALSE)[[1]]
  expect_equal(environment(tool2$clone)$private$def_calc_auc, FALSE)
})

test_that("create_usrtool: store_res", {
  func <- create_example_func()

  expect_error(create_usrtool("xyz", func, store_res = TRUE), NA)
  expect_error(create_usrtool("xyz", func, store_res = FALSE), NA)

  expect_error(create_usrtool("xyz", func, store_res = 1),
               "store_res is not a flag")
  expect_error(create_usrtool("xyz", func, store_res = "TRUE"),
               "store_res is not a flag")

  tool1 <- create_usrtool("xyz", func)[[1]]
  expect_equal(environment(tool1$clone)$private$def_store_res, TRUE)

  tool2 <- create_usrtool("xyz", func, store_res = FALSE)[[1]]
  expect_equal(environment(tool2$clone)$private$def_store_res, FALSE)
})

test_that("create_usrtool: x and y", {
  tool = create_usrtool("t1", x=c(0,1,2), y=c(0,2,3))[[1]]
  expect_equal(tool$get_x(), c(0,1,2))
  expect_equal(tool$get_y(), c(0,2,3))
})

test_that("usr_wrapper", {
  testset <- create_testset("curve", "c1")[[1]]

  func <- create_example_func()

  tool1 <- create_usrtool("xyz", func)[[1]]
  res1 <- environment(tool1$clone)$private$f_wrapper(testset, calc_auc = FALSE,
                                                     store_res = TRUE)

  expect_equal(res1$x, c(0.00, 0.25, 0.50, 0.75, 1.00))
  expect_equal(res1$y, c(0.00, 0.25, 0.50, 0.75, 1.00))
  expect_true(is.na(res1$auc))

  res2 <- environment(tool1$clone)$private$f_wrapper(testset, calc_auc = FALSE,
                                                     store_res = FALSE)
  expect_true(is.null(res2))

  res3 <- environment(tool1$clone)$private$f_wrapper(testset, calc_auc = TRUE,
                                                     store_res = TRUE)
  expect_equal(res3$x, c(0.00, 0.25, 0.50, 0.75, 1.00))
  expect_equal(res3$y, c(0.00, 0.25, 0.50, 0.75, 1.00))
  expect_equal(res3$auc, 0.5)

})

ss = create_usrtool("ss", x=c(0,1,2), y=c(0,2,3))

