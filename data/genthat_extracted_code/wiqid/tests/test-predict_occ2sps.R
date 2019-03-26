# File created 2017-05-27

# test_that code for predict methods

context("Predict method for occ2sps")

test_that("Predict works for occ2sps",  {
  require(wiqid)
  data(railSims)
  DHA <- railSims[, 1:3]
  DHB <- railSims[, 4:6]

  newdata <- expand.grid(logArea=c(-2.5, 0, 2.5), reeds=c(TRUE, FALSE))
  rownames(newdata) <- outer(c("S", "M", "L"), c(TRUE, FALSE), paste, sep=":")
  # Default model, no interaction
  rail1 <- occ2sps(DHA, DHB)
  expect_message(pred1psiA <- predict(rail1, newdata, "psiA"),
    "This is an intercept-only model")
  expect_equivalent(colMeans(pred1psiA), rail1$beta['psiA', ])
  expect_true(all(diff(pred1psiA[, 1]) == 0))
  expect_equal(rownames(pred1psiA), rownames(newdata))

  expect_message(pred1pB <- predict(rail1, newdata, "pB"),
    "This is an intercept-only model")
  expect_equivalent(colMeans(pred1pB), rail1$beta['pB', ])
  expect_true(all(diff(pred1pB[, 1]) == 0))

  expect_message(pred1psiBA <- predict(rail1, newdata, "psiBA"),
    "This is an intercept-only model")
  expect_equivalent(colMeans(pred1psiBA), rail1$beta['psiBA', ])
  expect_true(all(diff(pred1psiBA[, 1]) == 0))

  # Full interaction, no covars
  rail2 <- occ2sps(DHA, DHB, list(psiBA ~ 1, rA ~ 1, rBa ~ 1, rBA ~ 1))
  expect_message(pred2psiA <- predict(rail2, newdata, "psiA"),
    "This is an intercept-only model")
  expect_equivalent(colMeans(pred2psiA), rail2$beta['psiA', ])
  expect_true(all(diff(pred2psiA[, 1]) == 0))
  expect_equal(rownames(pred2psiA), rownames(newdata))

  # Model matching data generation function
  rail3 <- occ2sps(DHA, DHB,
    model=list(psiA ~ logArea, psiBA ~ reeds, rBA ~ 1), data=railSims)
  pred3psiA <- predict(rail3, newdata, "psiA")
  expect_equal(rownames(pred3psiA), rownames(newdata))
  expect_equivalent(round(colMeans(pred3psiA), 4), c(-0.1624, 0.5146, -1.1709, 0.8462))
  expect_equal(pred3psiA[1, ], pred3psiA[4, ])
  pred3psiBA <- predict(rail3, newdata, "psiBA")
  expect_equal(rownames(pred3psiBA), rownames(newdata))
  expect_equivalent(round(colMeans(pred3psiBA), 4), c(0.0637, 0.5123, -0.9404, 1.0677 ))
  expect_equal(pred3psiBA[1, ], pred3psiBA[3, ])
  expect_message(pred3rBA <- predict(rail3, newdata, "rBA"),
    "This is an intercept-only model")
  expect_equivalent(colMeans(pred3rBA), rail3$beta['rBA:(Intercept)', ])
  expect_true(all(diff(pred3rBA[, 1]) == 0))
  expect_equal(rownames(pred3rBA), rownames(newdata))

})
# ..............................................................
