context("data handling with fuzzylm and fuzzify")


test_that("warnings for spreads", {
	dat <- fuzzydat$nas
	
	expect_warning(fuzzylm(y~x,dat, method="fls", fuzzy.left.y = "yl", fuzzy.right.y = "yl"),
				   "spreads detected")

})


test_that("error for incorrect number of spreads for nsTFN", {
  
   expect_error(fuzzylm(y ~ x, data = fuzzydat$dia, method = "fls", fuzzy.left.y = "yl"),
                "two spreads")
})



test_that("warning on outlier in OPLR method", {

   expect_warning(fuzzylm(y ~ x, fuzzydat$hun, "oplr", , , "yl", "yl"),
                  "one outlier")
})


test_that("error on multiple outliers in OPLR method", {

  dat = fuzzydat$hun
  dat[1,3] = 4.0
  
  expect_error(fuzzylm(y ~ x, dat, "oplr", , , "yl", "yl"),
               "Multiple outliers")
})


test_that("error on partial matching in fuzzify", {

   expect_error(fuzzify(1:5, method = "m"),
                "not uniquely matched")
})


test_that("error on length of grouping elements in fuzzify", {

    expect_error(fuzzify(1:3, c("n", "m")),
                 "same length")
})


test_that("error on incorrect length of the err argument in fuzzify", {

    expect_error(fuzzify(1:3, , "err", err = 1:2),
                 "spreads included in the err argument")
})

test_that("number of rows for the error method with non-symmetric spreads", {

  expect_equal(nrow(fuzzify(1:2, , "err", err = 1:4)),
               2,
               tolerance = 1e-6)
})

test_that("parse variable names in fuzzify", {

   dat = data.frame(ex = 1:3, res = c(1,1,2))
   f = fuzzify(dat$ex, dat$res, dimnames = list("ex", "res"))
   expect_equal(colnames(f),
                c("exc", "exl", "exr", "res"))
})


test_that("warning on wordy dimnames in fuzzify", {
 
  expect_warning(fuzzify(1:3, method = "med", dimnames = list(c("a", "b"), "c")),
                 "first variable name")
})