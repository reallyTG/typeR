context("test ind_init")

ind_tbl <- ind_ex[, -1]
press_tbl <- press_ex[, -1]
time_vec <- ind_ex[, 1]
test <- ind_init(press_tbl = press_tbl, ind_tbl = ind_tbl,
  time = time_vec)
test2 <- ind_init(time = time_vec, press_tbl = press_tbl,
  ind_tbl = ind_tbl, train = 0.5, random = TRUE)

test_that("correct output", {
  expect_equal(length(test$ind_train[[1]]) + length(test$ind_test[[1]]),
    length(ind_ex[, 1]))
  expect_is(test$ind_train[[2]], class(ind_ex[, 2]))
  expect_equivalent(vapply(test[3, 1:3], class, character(1)),
    c("integer", "character", "character"))
  expect_equal(nrow(ind_init_ex), 84)
})

test_that("test the NA vector", {
  expect_equal(length(test$train_na[[1]]), 27)
  expect_equal(sum(test$train_na[[1]]), 0)
  expect_equal(sum(test2$train_na[[1]] == FALSE),
    15)
})


ind_tbl2 <- ind_ex[, 2:3]
ind_tbl2$TZA <- as.factor(ind_tbl2$TZA)
press_tbl2 <- press_ex[, 2:3]
press_tbl2$Tsum <- as.factor(press_tbl2$Tsum)
press_tbl3 <- press_ex[, 2:3]
press_tbl3$Tsum[27:30] <- NA

test_that("check error messages", {
  expect_error(ind_init(press_tbl = press_tbl, time = time_vec),
    "Argument ind_tbl is missing")
  expect_error(ind_init(ind_tbl = ind_tbl, time = time_vec),
    "Argument press_tbl is missing")
  expect_error(ind_init(ind = ind_tbl, press = press_tbl),
    "Argument time is missing")
  expect_error(ind_init(ind_tbl, press_tbl, time = ind_tbl),
    "time has to be a VECTOR!")
  expect_error(ind_init(ind_tbl, press_tbl, time = as.factor(time_vec)),
    "not a factor!")
  expect_error(ind_init(ind_tbl, press_tbl, time = as.character(time_vec)),
    "time has to be an INTEGER vector!")
  expect_error(ind_init(ind_tbl2, press_tbl, time_vec),
    "have to be NUMERIC!")
  expect_error(ind_init(ind_tbl, press_tbl2, time_vec),
    "have to be NUMERIC!")
  expect_error(ind_init(ind_tbl2, press_tbl2, time_vec),
    "have to be NUMERIC!")
  expect_error(ind_init(ind_tbl, press_tbl, time_vec[-1]),
    "The time steps in time")
  expect_error(ind_init(ind_tbl, press_tbl[-1, ],
    time_vec), "The time steps in time")
  expect_error(ind_init(ind_tbl[-(1:10), ], press_tbl[-1,
    ], time_vec), "The time steps in time")
  expect_error(ind_init(ind_tbl, press_tbl, time_vec,
    train = 1.5), "The train argument has to be")
  expect_message(ind_init(ind_tbl, press_tbl3, time_vec))
})


test1 <- ind_init(ind_tbl$TZA, press_tbl$Tsum, time_vec)
test2 <- ind_init(data.frame(y = ind_tbl$TZA), data.frame(x = press_tbl$Tsum),
  time_vec)

test_that("correct indicator and pressure names for vectors",
  {
    expect_true(test1$ind[1] == "ind")
    expect_true(test1$press[1] == "press")
    expect_true(test2$ind[1] == "y")
    expect_true(test2$press[1] == "x")
  })
