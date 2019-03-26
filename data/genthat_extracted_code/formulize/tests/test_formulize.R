context("test basic functionality")

library(glmnet)
library(recipes)

form <- mpg ~ hp + drat - 1
X <- model.matrix(form, mtcars)
y <- mtcars$mpg

rec <- recipe(form, data = mtcars)

test_that("get_design.formula works", {

  # warns on intercept only model
  expect_warning(get_design(mpg ~ 1, mtcars))

  design <- get_design(form, mtcars)

  expect_equal(design$X, X)
  expect_equivalent(design$y, y)
  expect_false(design$intercept)
  expect_true(get_design(mpg ~ drat, mtcars)$intercept)
})

test_that("get_design.recipe works", {

  design <- get_design(rec, mtcars)

  expect_equivalent(design$X, X)
  expect_equivalent(design$y, y)

  expect_false(design$intercept)
  expect_true(get_design(step_intercept(rec), mtcars)$intercept)
})

test_that("formulize and predict.wrapped work", {

  wrapped <- formulize(cv.glmnet)

  # interface agreement test
  set.seed(27)
  mat_mod <- cv.glmnet(X, y)

  set.seed(27)
  frm_mod <- wrapped(form, mtcars)

  set.seed(27)
  rec_mod <- wrapped(rec, mtcars)

  expect_equal(coef(frm_mod), coef(mat_mod))
  expect_equal(coef(rec_mod), coef(mat_mod))

  rec_preds <- predict(rec_mod, head(mtcars))
  frm_preds <- predict(frm_mod, head(mtcars))
  mat_preds <- predict(mat_mod, head(X))

  expect_equal(frm_preds, mat_preds)
  expect_equivalent(rec_preds, mat_preds)
})

test_that("genericize works", {

  expect_error(genericize(mean))
  expect_error(genericize(glmnet::cv.glmnet))

  expect_false(utils::isS3stdGeneric(cv.glmnet))

  genericize(cv.glmnet)  # call for side effects

  expect_equal(cv.glmnet.formula, formulize(cv.glmnet))
  expect_true(is.function(cv.glmnet.default))

  # repeat interface agreement test
  set.seed(27)
  mat_mod <- cv.glmnet(X, y)

  set.seed(27)
  frm_mod <- cv.glmnet(form, mtcars)

  set.seed(27)
  rec_mod <- cv.glmnet(rec, mtcars)

  expect_equal(coef(frm_mod), coef(mat_mod))
  expect_equal(coef(rec_mod), coef(mat_mod))

  rec_preds <- predict(rec_mod, head(mtcars))
  frm_preds <- predict(frm_mod, head(mtcars))
  mat_preds <- predict(mat_mod, head(X))

  expect_equal(frm_preds, mat_preds)
  expect_equivalent(rec_preds, mat_preds)

  # check that fname can be set, repeat tests with this new fname
  rm(list = ls())

  genericize(glmnet, "gnet")  # call for side effects

  expect_true(utils::isS3stdGeneric(gnet))
  expect_equal(gnet.formula, formulize(glmnet))
  expect_true(is.function(gnet.default))

  set.seed(27)
  mat_mod <- gnet(X, y)

  set.seed(27)
  frm_mod <- gnet(form, mtcars)

  set.seed(27)
  rec_mod <- gnet(rec, mtcars)

  rec_preds <- predict(rec_mod, head(mtcars))
  frm_preds <- predict(frm_mod, head(mtcars))
  mat_preds <- predict(mat_mod, head(X))
})
