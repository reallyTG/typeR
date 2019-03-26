source("testUtils.R")

###############
context("Java")
###############

test_that("version correctly parsed for JDK 8", {
  # mock version string function
  with_mock(
    java.version.string = function(){"1.8.0_151"},
    expect_equal(java.version(), 8)
  )
})

test_that("version correctly parsed for JDK 9", {
  # mock version string function
  version.strings <- c(
    "9",
    "9-internal",
    "9-ea+19",
    "9+100",
    "9.0.1+20",
    "9.0.2+12",
    "9.1.2+62",
    "9.1.3+15",
    "9.1.4+8",
    "9.2.4+45"
  )
  for(version.string in version.strings){
    with_mock(
      java.version.string = function(){version.string},
      expect_equal(java.version(), 9)
    )
  }
})

test_that("version correctly parsed for JDK 10", {
  # mock version string function
  version.strings <- c(
    "10",
    "10.0",
    "10.0.4",
    "10.1.2",
    "10.0.2",
    "10.0.2.1"
  )
  for(version.string in version.strings){
    with_mock(
      java.version.string = function(){version.string},
      expect_equal(java.version(), 10)
    )
  }
})
