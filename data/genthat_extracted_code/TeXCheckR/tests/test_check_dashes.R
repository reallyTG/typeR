context("Check dashes")

test_that("Does not error in math mode", {
  expect_null(check_dashes(filename = "./check-dashes/ok-despite-math.tex"))
  expect_null(check_dashes(filename = "./check-dashes/ok-despite-math-2.tex"))
  expect_null(check_dashes(filename = "./check-dashes/ok-despite-math-3.tex"))
  expect_null(check_dashes(filename = "./check-dashes/ok-despite-math-4.tex"))
})

test_that("Errors if hyphen wrongly typed", {
  expect_error(check_dashes(filename = "./check-dashes/bad-hyphen.tex"),
               regexp = "[Hh]yphen")
  expect_error(check_dashes(filename = "./check-dashes/bad-outside-math-1.tex"),
               regexp = "[Hh]yphen")
})

test_that("Hyphens adjacent are noticed", {
  expect_error(check_dashes("./check-dashes/hyphens-adj-dash-1.tex"),
               regexp = "[Hh]yphen adjacent to en-dash.")
  expect_error(check_dashes("./check-dashes/hyphens-adj-dash-2.tex"),
               regexp = "[Hh]yphen adjacent to en-dash.")
})

test_that("Emdashes detected", {
  expect_error(check_dashes("./check-dashes/has-emdash-1.tex"),
               regexp = "[Ee]m-dash")
})

test_that("emdashes are ok when protasis", {
  expect_error(check_dashes("./check-dashes/ok-if-protasis.tex", 
                            protases_ok = FALSE), 
               regexp = "[Ee]m-dash")
  expect_null(check_dashes("./check-dashes/ok-if-protasis.tex", 
                           protases_ok = TRUE))
})


test_that("emdashes are ok when requested", {
  skip_on_cran()
  tempf <- tempfile(fileext = ".tex")
  writeLines(c("A -- B", "C---D", "x-y", "\\(x - y\\)"), tempf)
  expect_error(check_dashes(tempf), "Em")
  expect_null(check_dashes(tempf, dash.consistency = c("en-dash", "em-dash")))
  expect_error(check_dashes(tempf, dash.consistency = c("em-dash")), "En")
  
})

