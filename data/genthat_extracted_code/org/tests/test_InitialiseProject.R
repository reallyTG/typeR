context("InitialiseProject")

test_that("Create org::PROJ$SHARED_TODAY", {
  AllowFileManipulationFromInitialiseProject()
  InitialiseProject(
    HOME = tempdir(),
    SHARED = tempdir(),
    RAW = tempdir()
  )

  expect_equal(TRUE, dir.exists(org::PROJ$SHARED_TODAY))
})

test_that("Error due to multiple non-existed folders", {
  AllowFileManipulationFromInitialiseProject()

  testthat::expect_error(
    InitialiseProject(
      HOME = c("dfsdfoij323423", "sdfd232323"),
      SHARED = tempdir(),
      RAW = tempdir()
    )
  )
})


test_that("Works due to multiple non-existed folders", {
  AllowFileManipulationFromInitialiseProject()
  InitialiseProject(
    HOME = c(tempdir(), "sdfd232323"),
    SHARED = tempdir(),
    RAW = tempdir()
  )

  expect_equal(TRUE, dir.exists(org::PROJ$SHARED_TODAY))
})
