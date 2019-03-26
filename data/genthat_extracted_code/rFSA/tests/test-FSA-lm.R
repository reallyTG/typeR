context("FSA-lm")

test_that("quad=TRUE,interaction=TRUE", {
  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=TRUE, interaction=TRUE, criterion=AIC,
             minmax="min", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~hp*wt"))
  expect_equal(res$table$criterion, 145.6109, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=TRUE, interaction=TRUE, criterion=r.squared,
             minmax="max", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~hp*wt"))
  expect_equal(res$table$criterion, 0.8847637, tolerance=1e-5)

})

test_that("quad=TRUE,interaction=FALSE", {
  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=TRUE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=TRUE, interaction=FALSE, criterion=r.squared,
             minmax="max", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 0.8302274, tolerance=1e-5)
})


test_that("quad=FALSE,interaction=TRUE", {
  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=TRUE, criterion=AIC,
             minmax="min", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~hp*wt"))
  expect_equal(res$table$criterion, 145.6109, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=TRUE, criterion=r.squared,
             minmax="max", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~hp*wt"))
  expect_equal(res$table$criterion, 0.8847637, tolerance=1e-5)

})

test_that("quad=FALSE,interaction=FALSE", {
  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=r.squared,
             minmax="max", numrs=10, m=2)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 0.8302274, tolerance=1e-5)
})

test_that("checkfeas", {
  expect_error(
    FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
        criterion=AIC, minmax="min", m=2, checkfeas="cyl"))
  expect_error(
    FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
        criterion=AIC, minmax="min", m=2, checkfeas=c("cyl",tempfile())))
  expect_error(
    FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
        criterion=AIC, minmax="min", m=2, checkfeas=1))

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=10, m=2, checkfeas=c("cyl","wt"))
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=1, m=2, checkfeas=c("cyl","carb"))
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula = "mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=2, m=2, checkfeas=c("am","carb"))
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)
})

test_that("var4int", {
  set.seed(123)
  res <- FSA(formula="mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=1, m=2, var4int="cyl")
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~cyl+wt"))
  expect_equal(res$table$criterion, 156.0101, tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="mpg~hp+wt", data=mtcars, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=1, m=2, var4int="carb")
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~wt+carb"))
  expect_equal(res$table$criterion, 162.4404, tolerance=1e-5)
})

test_that("min.nonmissing", {
  mtcars2 <- mtcars
  mtcars2$cyl[-c(1,2)] <- NA
  mtcars2$wt[-c(1,2)] <- NA
  set.seed(123)
  res <- FSA(formula="mpg~hp+wt", data=mtcars2, fitfunc=lm,
             quad=FALSE, interaction=FALSE, criterion=AIC,
             minmax="min", numrs=1, m=2, min.nonmissing=3)
  expect_equivalent(as.formula(res$table$formula[1]), as.formula("mpg~hp+am"))
  expect_equal(res$table$criterion, 164.0061, tolerance=1e-5)
})
