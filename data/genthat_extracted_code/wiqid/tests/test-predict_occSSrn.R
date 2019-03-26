# File created 2017-05-23

# test_that code for predict methods

# predict is implemented for occSSrn0 and occSSrnSite
# currently, occSSrn subcontacts to one of those 2.

context("Predict method for occSSrn")

test_that("predict works with occSSrn0",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  n <- rep(ncol(salamanders), nrow(salamanders))
  y <- rowSums(salamanders)

  res <- occSSrn0(y, n)
  newdata <- data.frame(dummy = 1:3)
  rownames(newdata) <- c("A", "B", "C")
  expect_message(predLam <- predict(res, newdata, "lambda"),
    "This is an intercept-only model")
  expect_equal(attr(predLam, "link"), "log")
  expect_equal(nrow(predLam), nrow(newdata))
  expect_equal(rownames(predLam), rownames(newdata))
  expect_equal(colnames(predLam), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predLam), 4), c(0.1332, 0.4494, -0.7476 ,1.0141))

  expect_message(predr <- predict(res, newdata, "r"),
    "This is an intercept-only model")
  expect_equal(attr(predr, "link"), "logit")
  expect_equal(nrow(predr), nrow(newdata))
  expect_equal(rownames(predr), rownames(newdata))
  expect_equal(colnames(predr), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predr), 4), c(-1.7546, 0.5261, -2.7857, -0.7235))

  predLam <- predict(res, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.1425, 0.5135, 0.4735, 2.7568))
  predr <- predict(res, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1475, 0.0661, 0.0581, 0.3266))

  res2 <- occSSrn0(y, n, link="probit")
  predLam <- predict(res2, newdata, "lambda")
  expect_equal(attr(predLam, "link"), "log")
  expect_equivalent(round(colMeans(predLam), 4), c(0.1332,  0.4495, -0.7477,  1.0142 ))
  predr <- predict(res2, newdata, "r")
  expect_equal(attr(predr, "link"), "probit")
  expect_equivalent(round(colMeans(predr), 4), c(-1.0474,  0.2870, -1.6098, -0.4849))

  predLam <- predict(res2, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.1425, 0.5135, 0.4734, 2.7571))
  predr <- predict(res2, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1475, 0.0661, 0.0537, 0.3139))
 } )

# ..............................................................

test_that("predict works with occSSrnSite",  {
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))
  weta.covs <- weta[, 6:11]
  set.seed(123)
  weta.covs$nons <- rnorm(nrow(weta))

  newdata <- expand.grid(Browsed=c(TRUE, FALSE), nons=c(-1,0,1))
  rownames(newdata) <- LETTERS[1:nrow(newdata)]
  # Full model for lambda
  res <- occSSrnSite(y, n, lambda ~ Browsed + nons, data=weta.covs)
  expect_silent(predLam <- predict(res, newdata, "lambda"))
  expect_equal(attr(predLam, "link"), "log")
  expect_equal(nrow(predLam), nrow(newdata))
  expect_equal(rownames(predLam), rownames(newdata))
  expect_equal(colnames(predLam), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predLam), 4), c(0.1830,  0.4186, -0.6375,  1.0034))
  predLam <- predict(res, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.2527, 0.5216, 0.5544, 2.8358))

  expect_message(predr <- predict(res, newdata, "r"),
    "This is an intercept-only model")
  expect_equal(attr(predr, "link"), "logit")
  expect_equal(nrow(predr), nrow(newdata))
  expect_equal(rownames(predr), rownames(newdata))
  expect_equal(colnames(predr), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predr), 4), c(-1.4015,  0.4381, -2.2602, -0.5428))
  predr <- predict(res, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1976, 0.0695, 0.0945, 0.3675))

  res2 <- occSSrnSite(y, n, lambda ~ Browsed + nons, data=weta.covs, link="probit")
  predLam <- predict(res2, newdata, "lambda")
  expect_equal(attr(predLam, "link"), "log")
  expect_equivalent(round(colMeans(predLam), 4), c(0.1830,  0.4187, -0.6376,  1.0035))
  predLam <- predict(res2, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.2527, 0.5217, 0.5543, 2.8360))

  predr <- predict(res2, newdata, "r")
  expect_equal(attr(predr, "link"), "probit")
  expect_equivalent(round(colMeans(predr), 4), c(-0.8503,  0.2500, -1.3402, -0.3603))
  predr <- predict(res2, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1976, 0.0695, 0.0901, 0.3593))

  # Model for lambda and r
  res <- occSSrnSite(y, n, list(lambda ~ nons, r ~ Browsed), data=weta.covs)
  expect_silent(predLam <- predict(res, newdata, "lambda"))
  expect_equal(attr(predLam, "link"), "log")
  expect_equal(nrow(predLam), nrow(newdata))
  expect_equal(rownames(predLam), rownames(newdata))
  expect_equal(colnames(predLam), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predLam), 4), c(0.3014,  0.4099, -0.5020,  1.1047))
  predLam <- predict(res, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.3535, 0.5552, 0.6062, 3.0266))

  expect_silent(predr <- predict(res, newdata, "r"))
  expect_equal(attr(predr, "link"), "logit")
  expect_equal(nrow(predr), nrow(newdata))
  expect_equal(rownames(predr), rownames(newdata))
  expect_equal(colnames(predr), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predr), 4), c(-1.5367,  0.5044, -2.5253, -0.5480))
  predr <- predict(res, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1804, 0.0729, 0.0775, 0.3675 ))

  res2 <- occSSrnSite(y, n, list(lambda ~ nons, r ~ Browsed), data=weta.covs, link="probit")
  predLam <- predict(res2, newdata, "lambda")
  expect_equal(attr(predLam, "link"), "log")
  expect_equivalent(round(colMeans(predLam), 4), c(0.3014,  0.4100, -0.5021,  1.1049 ))
  predLam <- predict(res2, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.3535, 0.5553, 0.6061, 3.0270))

  predr <- predict(res2, newdata, "r")
  expect_equal(attr(predr, "link"), "probit")
  expect_equivalent(round(colMeans(predr), 4), c(-0.9242,  0.2821, -1.4771, -0.3713 ))
  predr <- predict(res2, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.1804, 0.0729, 0.0728, 0.3563))

  # Intercept only:
  newdata <- expand.grid(Browsed=c(TRUE, FALSE), nons=c(-1,0,1))
  res <- occSSrnSite(y, n)
  rownames(newdata) <- LETTERS[1:nrow(newdata)]
  expect_message(predLam <- predict(res, newdata, "lambda"),
    "This is an intercept-only model")
  expect_equal(attr(predLam, "link"), "log")
  expect_equal(nrow(predLam), nrow(newdata))
  expect_equal(rownames(predLam), rownames(newdata))
  expect_equal(colnames(predLam), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predLam), 4), c(0.1506,  0.3329, -0.5018,  0.8031))
  predLam <- predict(res, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.1626, 0.3870, 0.6055, 2.2324))

  expect_message(predr <- predict(res, newdata, "r"),
    "This is an intercept-only model")
  expect_equal(attr(predr, "link"), "logit")
  expect_equal(nrow(predr), nrow(newdata))
  expect_equal(rownames(predr), rownames(newdata))
  expect_equal(colnames(predr), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predr), 4), c(-1.3296,  0.4147, -2.1423, -0.5168))
  predr <- predict(res, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.2092, 0.0686, 0.1050, 0.3736))

  res2 <- occSSrn0(y, n, link="probit")
  predLam <- predict(res2, newdata, "lambda")
  expect_equal(attr(predLam, "link"), "log")
  expect_equivalent(round(colMeans(predLam), 4), c(0.1506,  0.3329, -0.5019,  0.8031))
  predLam <- predict(res2, newdata, "lambda", type="response")
  expect_equivalent(round(colMeans(predLam), 4), c(1.1626, 0.3870, 0.6054, 2.2326))

  predr <- predict(res2, newdata, "r")
  expect_equal(attr(predr, "link"), "probit")
  expect_equivalent(round(colMeans(predr), 4), c(-0.8091,  0.2386, -1.2768, -0.3414))
  predr <- predict(res2, newdata, "r", type="response")
  expect_equivalent(round(colMeans(predr), 4), c(0.2092, 0.0686, 0.1008, 0.3664))
} )

