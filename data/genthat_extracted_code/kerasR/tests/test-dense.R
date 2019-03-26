library(kerasR)

context("Testing dense layers")

check_keras_available <- function() {
  if (!requireNamespace("reticulate")) {
    skip("Python or reticulate not available")
  } else if (!reticulate::py_module_available("keras")) {
    skip("keras module is not installed.")
  }
}

test_that("dense model", {
  skip_on_cran()
  check_keras_available()

  X_train <- matrix(rnorm(100 * 10), nrow = 100)
  Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)

  mod <- Sequential()
  mod$add(Dense(units = 50, input_shape = dim(X_train)[2]))
  mod$add(Dropout(rate = 0.5))
  mod$add(Activation("relu"))
  mod$add(Dense(units = 3))
  mod$add(ActivityRegularization(l1 = 1))
  mod$add(Activation("softmax"))
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())

  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)

  pred <- keras_predict(mod, X_train)
  testthat::expect_equal(dim(pred), c(100L, 3L))
})



