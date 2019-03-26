library(welchADF)

test_that("update with a two-way between-factor model fitted via welchADF.test-data.frame", {
  expect_true({
    omnibus_LSM <- welchADF.test(womenStereotypeData, response = "y", between.s =
                                   c("condition", "sex"), contrast = "omnibus", effect = "condition")
  TRUE})
  expect_true({
    omnibus_trimmed <- update(omnibus_LSM, trimming = TRUE, effect = NULL) # unset value of "effect"
  TRUE})
  expect_true({
    pairwise_LSM <- update(omnibus_LSM, contrast = "all.pairwise", effect = c("condition", "sex"))
  TRUE})
})

test_that("update with a model fitted via formula", {

  omnibus_LSM <- welchADF.test(y ~ Group, data = perceptionData)
  # this should not throw errors
  
  expect_true({pairwise_LSM <- update(omnibus_LSM, effect = "Group", contrast = "all.pairwise"); TRUE})
  expect_true({pairwise_trimmed_boot <- update(pairwise_LSM, trimming = TRUE, bootstrap = TRUE, seed = 12345); TRUE})
  expect_true({print(pairwise_trimmed_boot); TRUE})
  expect_true({print(summary(pairwise_trimmed_boot)); TRUE})
})

test_that("update on a model returned by welchADF.test.lm", {
  ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
  trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
  group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
  weight <- c(ctl, trt)
  lm.D9 <- lm(weight ~ group)
  
  expect_true({omnibus_LSM = welchADF.test(lm.D9); TRUE})
  expect_true({pairwise_LSM = update(omnibus_LSM, contrast = "all.pairwise", effect = "group"); TRUE})
  expect_true({print(pairwise_LSM); TRUE})
  expect_true({print(summary(pairwise_LSM)); TRUE})
  expect_true({model.frame(pairwise_LSM); TRUE})
  expect_true({formula(pairwise_LSM); TRUE})
})