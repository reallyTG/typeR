context("ad object")

x1_0 <- c(1,.2,3,1,1,.7,-2,-1)
x2_0 <- c(0,.5,0,.4,0,1,-.3,-.1)
x_0 <- do.call(cbind,list(x1_0,x2_0))
y_0 <- c(0,0,0,0,0,0,1,1)
dframe_0 <- data.frame(x_0,y_0)
names(dframe_0) <- c("x1_0", "x2_0", "y_0")
suppressWarnings(RNGversion("3.5.0"))
set.seed(1234)
df_fit_0 <- ad(y_0 ~ x1_0 + x2_0, dframe_0)
suppressWarnings(RNGversion("3.5.0"))
set.seed(1234)
mat_fit_0 <- ad(x = x_0, y = y_0)
suppressWarnings(RNGversion("3.5.0"))
set.seed(1234)
df_fit_1 <- ad(y_0 ~ x1_0 + x2_0, dframe_0, univariate = FALSE)
suppressWarnings(RNGversion("3.5.0"))
set.seed(1234)
mat_fit_1 <- ad(x = x_0, y = y_0, univariate = FALSE)


test_that("class of fit object excludes formula when using default notation",{
  expect_identical(class(df_fit_0),c("ad.formula","ad"))
  expect_identical(class(mat_fit_0),c("ad"))
  expect_is(df_fit_0,c("ad"))
  expect_is(df_fit_0,c("ad.formula")) #check inheritance
  expect_is(mat_fit_0,c("ad")) #check inheritance
})


test_that("fit is the same for formula and matrix data",{
  expect_identical(df_fit_0$epsilon,mat_fit_0$epsilon)
  expect_identical(df_fit_0$train_mean,mat_fit_0$train_mean)
  expect_identical(df_fit_0$train_var,mat_fit_0$train_var)
  expect_identical(df_fit_0$train_predictions,mat_fit_0$train_predictions)
  expect_false(identical(df_fit_0$call,mat_fit_0$call))
})


test_that("fit object contains required attributes", {
  expect_equal(attributes(df_fit_0)$names,c("call", "univariate", "score",
                                            "steps", "epsilon",
                                            "train_mean", "train_var",
                                            "val_score", "terms"))
  expect_equal(attributes(mat_fit_0)$names,c("call", "univariate", "score",
                                             "steps", "epsilon",
                                             "train_mean",
                                             "train_var", "val_score"))
})


test_that("fail when x or y is not numeric", {
  x1 <- c("0",.2,3,1,4,.9,-2,-1)
  x2 <- c(0,.5,1,2.4,1.0,1,-.3,-.1)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,0,0,0,1,1)
  dframe <- data.frame(x,y)
  expect_error(ad(y ~ x1 + x2, dframe),"Both x and y must be numeric.", fixed = TRUE)
  expect_error(ad(x = x, y = y),"Both x and y must be numeric.", fixed = TRUE)
})

test_that("fail when y has anything other than 0 and 1", {
  x1 <- c(0,.2,3,1,4,.9,-2,-1)
  x2 <- c(0,.5,1,2.4,1.0,1,-.3,-.1)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,0,0,0,1,2)
  dframe <- data.frame(x,y)
  expect_error(ad(y ~ x1 + x2, dframe),"y must contain only 0 and 1, and both classes must be represented (normal = 0, anomaly = 1).",
               fixed = TRUE)

  y <- c(0,0,0,0,0,0,0,0)
  dframe <- data.frame(x,y)
  expect_error(ad(y ~ x1 + x2, dframe),"y must contain only 0 and 1, and both classes must be represented (normal = 0, anomaly = 1).",
               fixed = TRUE)

  y <- c(1,1,1,1,1,1,1,1)
  dframe <- data.frame(x,y)
  expect_error(ad(y ~ x1 + x2, dframe),"y must contain only 0 and 1, and both classes must be represented (normal = 0, anomaly = 1).",
               fixed = TRUE)

})


test_that("NAs are treated correctly", {
  x1 <- c(1,NA,3,1,4,.9,-2,-1)
  x2 <- c(0,.5,1,2.4,1.0,1,-.3,-.1)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,0,0,0,1,1)
  dframe <- data.frame(x,y)
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(142)
  df_fit <- ad(y ~ x1 + x2, dframe)
  expect_equal(df_fit$train_mean,c(1.966667,1.466667), tolerance = 0.00001)
  expect_equal(df_fit$epsilon,0.004203277)
})


test_that("fit object is printed with call and epsilon", {
  x1 <- c(0,.2,3,1,1,-.8,-2,-1)
  x2 <- c(1,.2,0.4,-3,0,-1,-.3,-.1)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,0,0,1,1,1)
  dframe <- data.frame(x,y)
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(321)
  df_fit <- ad(y ~ x1 + x2, dframe)
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(321)
  mat_fit <- ad(x = x, y = y)

  expect_output(print(df_fit),
                "Call:\nad(formula = y ~ x1 + x2, data = dframe)\n\nepsilon: 0.0007921529",
                fixed = TRUE)
  expect_output(print(mat_fit),
                "Call:\nad.default(x = x, y = y)\n\nepsilon: 0.0007921529",
                fixed = TRUE)
})

test_that("no errors when calling with univariate argument", {
  expect_silent(ad(y_0 ~ x1_0 + x2_0, data = dframe_0, univariate = TRUE))
  expect_silent(ad(x = x_0, y = y_0, univariate = TRUE))
  expect_silent(ad(y_0 ~ x1_0 + x2_0, data = dframe_0, univariate = FALSE))
  expect_silent(ad(x = x_0, y = y_0, univariate = FALSE))
})

test_that("fail when score is not one of expected strings", {
  expect_error(ad(y_0 ~ x1_0+x2_0, dframe_0, score = "foo"),
               "score must be one of 'f1' or 'mcc'.", fixed = TRUE)
  expect_error(ad(x_0, y_0, score = "bar"),
               "score must be one of 'f1' or 'mcc'.", fixed = TRUE)
})

test_that("fail when univariate is not logical", {
  expect_error(ad(y_0 ~ x1_0 + x2_0, dframe_0, univariate = 'foo'),
               "univariate must be logical.", fixed = TRUE)
  expect_error(ad(y_0 ~ x1_0 + x2_0, dframe_0, univariate = 3),
               "univariate must be logical.", fixed = TRUE)
})

test_that("ad matches expected values for univar", {
  expect_equal(df_fit_0$train_mean,c(0.925, 0.350))
  expect_equal(df_fit_0$train_var,c(0.0225000000, 0.2233333333))
  expect_equal(df_fit_0$epsilon,1.805404e-08)
  expect_equal(df_fit_0$val_score,0.8)

  expect_equal(mat_fit_0$train_mean,c(0.925, 0.350))
  expect_equal(mat_fit_0$train_var,c(0.0225000000, 0.2233333333))
  expect_equal(mat_fit_0$epsilon,1.805404e-08)
  expect_equal(mat_fit_0$val_score,0.8)
})

test_that("ad matches expected values for multivar", {
  expect_equal(df_fit_1$train_mean,c(0.925, 0.350))
  expect_equal(as.vector(df_fit_1$train_var),c(0.0225000, -0.0650000, -0.0650000, 0.2233333333))
  expect_equal(df_fit_1$epsilon,3.861272e-31)
  expect_equal(df_fit_1$val_score,0.8)

  expect_equal(mat_fit_1$train_mean,c(0.925, 0.350))
  expect_equal(as.vector(df_fit_1$train_var),c(0.0225000, -0.0650000, -0.0650000, 0.2233333333))
  expect_equal(mat_fit_1$epsilon,3.861272e-31)
  expect_equal(mat_fit_1$val_score,0.8)
})


test_that("ad fails when variance = 0 for a feature", {
  x1 <- c(0,1,2,3)
  x2 <- c(1,1,1,1)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,1)
  dframe <- data.frame(x,y)
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(321)
  expect_error(ad(y ~ x1 + x2, dframe),"Feature with 0 variance found in training set. This results in Inf pdf values.",
               fixed = TRUE)
})

