context("Tool: precrec")
# Test Toolprecrec
#      create_toolset
#

test_that("Toolprecrec - R6ClassGenerator", {
  expect_true(is(Toolprecrec, "R6ClassGenerator"))
  expect_equal(attr(Toolprecrec, "name"), "Toolprecrec_generator")

  expect_equal(grep("precrec",
                    body(Toolprecrec$private_methods$f_wrapper))[[1]], 2)
})

test_that("Toolprecrec - R6", {
  toolset <- Toolprecrec$new()

  expect_true(is(toolset, "Toolprecrec"))
  expect_true(is(toolset, "ToolIFBase"))
  expect_true(is(toolset, "R6"))
})

test_that("create_toolset", {
  toolset1 <- create_toolset("PREC")[[1]]
  expect_true(is(toolset1, "Toolprecrec"))
  expect_equal(toolset1$get_toolname(), "precrec")

  toolset2 <- create_toolset("prec")[[1]]
  expect_true(is(toolset2, "Toolprecrec"))
  expect_equal(toolset2$get_toolname(), "precrec")
})

test_that("create_toolset: calc_auc", {
  toolset1 <- create_toolset("precrec")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_calc_auc, TRUE)

  toolset2 <- create_toolset("precrec", calc_auc = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_calc_auc, FALSE)
})

test_that("create_toolset: store_res", {
  toolset1 <- create_toolset("precrec")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_store_res, TRUE)

  toolset2 <- create_toolset("precrec", store_res = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_store_res, FALSE)
})

test_that(".precrec_wrapper", {
  testset <- create_testset("curve", "c1")[[1]]
  res <- .precrec_wrapper(testset)

  expect_true(length(res$x) > 1000)
  expect_true(length(res$y) > 1000)
  expect_true(is.na(res$auc))

  res2 <- .precrec_wrapper(testset, store_res = FALSE)
  expect_true(is.null(res2))

  res3 <- .precrec_wrapper(testset, calc_auc = TRUE)
  expect_true(length(res$x) > 1000)
  expect_true(length(res$y) > 1000)
  expect_equal(res3$auc, 0.8873267, tolerance = .001)
})
