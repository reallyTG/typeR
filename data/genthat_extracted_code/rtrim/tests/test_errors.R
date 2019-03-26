context("Errors")

test_that("data issues", {
  # test duplicate counts
  df <- data.frame(site=1, year=c(1,2,2), count=1)
  expect_error(trim(count ~ site+year, data=df, model=3),
               "More than one observation given for at least one site/year combination.")
})

context("formula interface errors")

test_that("invalid formulas", {

  df <- data.frame(count=1, site=2, year=3, month=4, habitat=5, acid=5)

  expect_error(trim(count + onzin, df),       "object .* not found")
  # expect_error(trim(count ~ site + year),     "no data given", fixed=TRUE)
  # expect_error(trim(count ~ site + year, pi), "data should be a data frame", fixed=TRUE)
  # expect_error(trim(count ~ site, df),        "model should have form 'count ~ site + year ...", fixed=TRUE)
  # expect_error(trim(count + site ~ year, df), "model should have form 'count ~ ...'", fixed=TRUE)
  # expect_error(trim(count ~ site - year, df), "Model contains unallowed operator: -", fixed=TRUE)
  # expect_error(trim(count ~ site + year + habitat : acid, df), "covariates should be included using the '+' operator (':' found)", fixed=TRUE)
})

context("Warnings")

test_that("empty sites", {
  A <- data.frame(site="A", year=1:2, count=c(1,1))  # filled site
  B <- data.frame(site="B", year=1:2, count=0) # empty site
  AB <- rbind(A,B)
  expect_warning(trim(count ~ site+year, data=AB, model=3),
       "Removed 1 site without positive observations: (B)", fixed=TRUE)
})