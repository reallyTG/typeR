library("testthat")

test_that("data.frame restore", {
  fileName = tempfile()
  settings <- list(a = "a",
                   b = data.frame(x = c(1,2,3), 
                                  y = c("p", "q", "r"), 
                                  stringsAsFactors = FALSE))
  saveSettingsToJson(settings, fileName)
  settings2 <- loadSettingsFromJson(fileName)
  unlink(fileName)
  expect_equal(class(settings$b), class(settings2$b))
  expect_equivalent(settings, settings2)
})


test_that("list with empty vectors", {
  fileName = tempfile()
  settings <- list(x = "a",
                   y = c())
  saveSettingsToJson(settings, fileName)
  settings2 <- loadSettingsFromJson(fileName)
  unlink(fileName)
  expect_equal(class(settings$y), class(settings2$y))
  expect_equivalent(settings, settings2)
})
