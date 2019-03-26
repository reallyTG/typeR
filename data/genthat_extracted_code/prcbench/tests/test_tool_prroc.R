context("Tool: PRROC")
# Test ToolPRROC
#      create_toolset
#

.check_prroc_ver <- function(min_ver) {
  compareVersion(as.character(packageVersion("PRROC")), min_ver)
}

test_that("ToolPRROC - R6ClassGenerator", {
  expect_true(is(ToolPRROC, "R6ClassGenerator"))
  expect_equal(attr(ToolPRROC, "name"), "ToolPRROC_generator")

  expect_true(is.function(ToolPRROC$public_methods$set_curve))
  expect_true(is.function(ToolPRROC$public_methods$set_minStepSize))

  expect_equal(grep(".prroc_wrapper",
                    body(ToolPRROC$private_methods$f_wrapper))[[1]], 2)
})

test_that("ToolPRROC - R6", {
  toolset <- ToolPRROC$new()

  expect_true(is(toolset, "ToolPRROC"))
  expect_true(is(toolset, "ToolIFBase"))
  expect_true(is(toolset, "R6"))

  expect_true(is.function(toolset[["set_curve"]]))
  expect_true(is.function(toolset[["set_minStepSize"]]))
})

test_that("ToolPRROC$new(curve)", {
  toolset1 <- ToolPRROC$new()
  expect_equal(environment(toolset1$clone)$private$curve, TRUE)

  toolset2 <- ToolPRROC$new(curve = FALSE)
  expect_equal(environment(toolset2$clone)$private$curve, FALSE)
})

test_that("ToolPRROC$new(minStepSize)", {
  toolset1 <- ToolPRROC$new()
  expect_equal(environment(toolset1$clone)$private$minStepSize, 0.01)

  toolset2 <- ToolPRROC$new(minStepSize = 0.5)
  expect_equal(environment(toolset2$clone)$private$minStepSize, 0.5)

  toolset2$set_minStepSize(1)
  expect_equal(environment(toolset2$clone)$private$minStepSize, 1)
})

test_that("ToolPRROC$new(aucType)", {
  toolset1 <- ToolPRROC$new()
  expect_equal(environment(toolset1$clone)$private$aucType, 1)

  toolset2 <- ToolPRROC$new(aucType = 2)
  expect_equal(environment(toolset2$clone)$private$aucType, 2)

  toolset2$set_aucType(1)
  expect_equal(environment(toolset2$clone)$private$aucType, 1)
})

test_that("create_toolset", {
  toolset1 <- create_toolset("PRR")[[1]]
  expect_true(is(toolset1, "ToolPRROC"))
  expect_equal(toolset1$get_toolname(), "PRROC")

  toolset2 <- create_toolset("prr")[[1]]
  expect_true(is(toolset2, "ToolPRROC"))
  expect_equal(toolset2$get_toolname(), "PRROC")
})

test_that("create_toolset: calc_auc", {
  toolset1 <- create_toolset("PRROC")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_calc_auc, TRUE)

  toolset2 <- create_toolset("PRROC", calc_auc = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_calc_auc, FALSE)
})

test_that("create_toolset: store_res", {
  toolset1 <- create_toolset("PRROC")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_store_res, TRUE)

  toolset2 <- create_toolset("PRROC", store_res = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_store_res, FALSE)
})

test_that(".prroc_wrapper", {
  testset <- create_testset("curve", "c1")[[1]]
  res <- .prroc_wrapper(testset)

  if (.check_prroc_ver("1.2") < 0) {
    expect_equal(length(res$x), 202)
    expect_equal(length(res$y), 202)
  } else {
    expect_equal(length(res$x), 106)
    expect_equal(length(res$y), 106)
  }

  expect_true(is.na(res$auc))

  res2 <- .prroc_wrapper(testset, store_res = FALSE)
  expect_true(is.null(res2))

  res3 <- .prroc_wrapper(testset, calc_auc = TRUE)
  if (.check_prroc_ver("1.2") < 0) {
    expect_equal(length(res$x), 202)
    expect_equal(length(res$y), 202)
  } else {
    expect_equal(length(res$x), 106)
    expect_equal(length(res$y), 106)
  }
  expect_equal(res3$auc, 0.8873265, tolerance = .001)
})
