context("compute results")

test_that("computeResults simple example", {
  
  testDat <- data.frame(
    t = 1:3,
    bone = c(100, 50, 0),
    mean = c(1, 3, 50),
    sd = c(1, 3, 50)
  )
  y <- computeResult(
    data = testDat,
    timeVars = "t",
    boneVars = "bone",
    meanVar = "mean",
    sdVar = "sd"
    )
  
  expect_s3_class(y, "data.frame")
  expect_type(y, "list")
  expect_equal(y$mean, 2)
  expect_equal(y$sd, 1.802776, tolerance = 0.001)
})

test_that("computeResults two bones", {
  
  testDat <- data.frame(
    t = 1:3,
    bone = c(100, 50, 0),
    tooth = c(0, 0, 100),
    mean = c(1, 3, 50),
    sd = c(1, 3, 50)
  )
  y <- computeResult(
    data = testDat,
    timeVars = "t",
    boneVars = c("bone", "tooth"),
    meanVar = "mean",
    sdVar = "sd"
  )
  
  expect_s3_class(y, "data.frame")
  expect_type(y, "list")
  expect_equal(dim(y), c(2, 2))

})


test_that("computeResult stops", {
  
  dat <- data.frame(
    bone = c(100, 50, 20),
    time = 1:3,
    mean = 2,
    sd = -1
  )
  
  expect_error(
    computeResult(
      data = dat,
      boneVars = c("bone"),
      timeVars = c("time"),
      meanVar = c("mean"),
      sdVar = c("sd")
    ),
    "all(data[sdVar] > 0) is not TRUE",
    fixed = TRUE
  )
  
  dat <- data.frame(
    bone = c(120, 50, 20),
    time = 1:3,
    mean = 2,
    sd = 1
  )
  
  expect_error(
    computeResult(
      data = dat,
      boneVars = c("bone"),
      timeVars = c("time"),
      meanVar = "mean",
      sdVar = "sd"
    ),
    "max(data[boneVars]) <= 100 is not TRUE",
    fixed = TRUE
  )
  
})
