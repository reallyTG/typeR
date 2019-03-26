library(RWDataPlyr)

context("test `read_rwd_agg()` and `rwd_agg_template()`")

good_csv <- system.file(
  "extdata/rwd_agg_files/passing_aggs.csv", 
  package = "RWDataPlyr"
)

bad_csv <- system.file("extdata/SlotAggTable.csv", package = "RWDataPlyr")

oPath <- file.path(tempdir(), "rwd_agg_template")
dir.create(oPath)
teardown({
  unlink(oPath, recursive = TRUE)
})

rwd_agg_template(file = "rwa.csv", path = oPath, examples = TRUE)
rwd_agg_template(file = "tmp.csv", path = oPath)

# rwd_agg_template files ---------------
test_that("`rwd_agg_template()` creates good files", {
  t1 <- read_rwd_agg(file.path(oPath, "rwa.csv"))
  t2 <- read_rwd_agg(file.path(oPath, "tmp.csv"))
  expect_s3_class(t1, "rwd_agg")
  expect_equal(nrow(t1), 5)
  expect_s3_class(t2, "rwd_agg")
  expect_equal(nrow(t2), 0)
})

# rwd_agg_template errors ----------------
test_that("`rwd_agg_template()` errors correctly", {
  expect_error(rwd_agg_template())
  expect_error(rwd_agg_template(file = 1))
  expect_error(rwd_agg_template(file = c("this.csv", "that.csv")))
  expect_error(rwd_agg_template(file = "test.txt"))
  expect_error(rwd_agg_template(path = 3))
  expect_error(rwd_agg_template(path = c("this/that", "there/then")))
  expect_error(rwd_agg_template(path = "unkown/path"))
  expect_error(rwd_agg_template(examples = NA))
  expect_error(rwd_agg_template(examples = c(TRUE, FALSE)))
})

# read_rwd_agg works --------------------
# already tested above to some extent but test one other, and test bad file

test_that("`read_rwd_agg()` works", {
  expect_s3_class(t1 <- read_rwd_agg(good_csv), "rwd_agg")
  expect_equal(nrow(t1), 7)
  expect_error(read_rwd_agg(bad_csv))
  expect_error(read_rwd_agg(c("this.csv", "that.csv")))
  expect_error(read_rwd_agg("doesnotexist.csv"))
  expect_error(read_rwd_agg("rwa.txt"))
  expect_error(read_rwd_agg(1))
  expect_error(read_rwd_agg(FALSE))
})
