context("Tool: AUCCalculator")
# Test ToolAUCCalculator
#      create_toolset
#

test_that("ToolAUCCalculator - R6ClassGenerator", {
  expect_true(is(ToolAUCCalculator, "R6ClassGenerator"))
  expect_equal(attr(ToolAUCCalculator, "name"), "ToolAUCCalculator_generator")

  expect_true(is.function(ToolAUCCalculator$public_methods$set_jarpath))
})

test_that("ToolAUCCalculator - R6", {
  toolset <- ToolAUCCalculator$new()

  expect_true(is(toolset, "ToolAUCCalculator"))
  expect_true(is(toolset, "ToolIFBase"))
  expect_true(is(toolset, "R6"))

  expect_true(is.function(toolset[["set_jarpath"]]))
})

test_that("ToolAUCCalculator$new(jarpath)", {
  jarpath <- system.file("java", "auc3.jar", package = "prcbench")
  toolset2 <- ToolAUCCalculator$new(jarpath = jarpath)
  expect_equal(environment(toolset2$clone)$private$jarpath, jarpath)
})

test_that("create_toolset", {
  toolset1 <- create_toolset("AUC")[[1]]
  expect_true(is(toolset1, "ToolAUCCalculator"))
  expect_equal(toolset1$get_toolname(), "AUCCalculator")

  toolset2 <- create_toolset("auc")[[1]]
  expect_true(is(toolset2, "ToolAUCCalculator"))
  expect_equal(toolset2$get_toolname(), "AUCCalculator")
})

test_that("create_toolset: calc_auc", {
  toolset1 <- create_toolset("AUCCalculator")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_calc_auc, TRUE)

  toolset2 <- create_toolset("AUCCalculator", calc_auc = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_calc_auc, FALSE)
})

test_that("create_toolset: store_res", {
  toolset1 <- create_toolset("AUCCalculator")[[1]]
  expect_equal(environment(toolset1$clone)$private$def_store_res, TRUE)

  toolset2 <- create_toolset("AUCCalculator", store_res = FALSE)[[1]]
  expect_equal(environment(toolset2$clone)$private$def_store_res, FALSE)
})

test_that("set_curvetype", {
  toolset1 <- create_toolset("AUCCalculator")[[1]]

  expect_equal(environment(toolset1$clone)$private$curvetype, "SPR")

  toolset1$set_curvetype("CCC")
  expect_equal(environment(toolset1$clone)$private$curvetype, "SPR")

  toolset1$set_curvetype("SPR")
  expect_equal(environment(toolset1$clone)$private$curvetype, "SPR")

  toolset1$set_curvetype("PR")
  expect_equal(environment(toolset1$clone)$private$curvetype, "PR")

  toolset1$set_curvetype("ROC")
  expect_equal(environment(toolset1$clone)$private$curvetype, "ROC")
})

test_that(".auccalc_wrapper", {
  testset <- create_testset("curve", "c1")[[1]]
  toolset <- create_toolset("AUCCalculator")[[1]]
  auc2 <- environment(toolset$clone)$private$auc2
  res <- .auccalc_wrapper(testset, auc2)

  if (length(res$x) > 0) {
    expect_equal(length(res$x), 100)
    expect_equal(length(res$y), 100)
    expect_true(is.na(res$auc))

    res2 <- .auccalc_wrapper(testset, auc2, store_res = FALSE)
    expect_true(is.null(res2))

    res3 <- .auccalc_wrapper(testset, auc2, calc_auc = TRUE)
    expect_equal(length(res$x), 100)
    expect_equal(length(res$y), 100)
    if (res3$auc != 0) {
      expect_equal(res3$auc, 0.9166667, tolerance = .001)
    }
  }

})

test_that(".del_auc_files", {
  files <- tempfile("test_del_auc", fileext = c(".roc", ".pr", ".spr"))

  expect_error(.del_auc_files("test_del_auc"), NA)
})

test_that(".load_java_obj", {
  toolset <- create_toolset("AUCCalculator")[[1]]

  jarpath <- environment(toolset$clone)$private$jarpath
  curvetype <- environment(toolset$clone)$private$curvetype

  obj <- .load_java_obj("auctest", jarpath, curvetype)
  expect_true(is(obj, "jobjRef"))
})
