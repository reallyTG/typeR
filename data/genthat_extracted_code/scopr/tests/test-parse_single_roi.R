context("parse_single_roi")

test_that("parse_single_roi works in normal conditions", {
  dir <- scopr_example_dir()
  test_file <- paste(dir, "ethoscope_results/029/E_029/2016-01-25_21-14-55/2016-01-25_21-14-55_029.db",sep="/")
  data <- data.table::data.table(id="xxx", region_id=1, file_info=list(list(path=test_file)), key="id")

  a <- scopr:::parse_single_roi(data, verbose = F)
  a <- scopr:::parse_single_roi(data, FUN= function(d){behavr::bin_apply_all(d,y = x)}, verbose = F)

  expect_true(all(a[,id] == "xxx"))
  expect_s3_class(a, "behavr")
  expect_identical(a[meta=T], data)
})


test_that("parse_single_roi works with memosiation", {
  dir <- scopr_example_dir()
  test_file <- paste(dir, "ethoscope_results/029/E_029/2016-01-25_21-14-55/2016-01-25_21-14-55_029.db",sep="/")
  cache <- tempfile("scopr_test_cache")

  data <- data.table::data.table(id="xxx", region_id=1, file_info=list(list(path=test_file)), key="id")
  a <- scopr:::parse_single_roi(data, verbose=F)
  b <- scopr:::parse_single_roi(data, cache = cache, verbose = F)
  c <- scopr:::parse_single_roi(data, cache = cache, verbose = F)

  expect_identical(a, b)
  expect_true(all(c == b) & identical(c[meta=T], b[meta=T]))
})



test_that("parse_single_roi works with autocolumn finding", {
  dir <- scopr_example_dir()
  test_file <- paste(dir, "ethoscope_results/029/E_029/2016-01-25_21-14-55/2016-01-25_21-14-55_029.db",sep="/")
  data <- data.table::data.table(id="xxx", region_id=1, file_info=list(list(path=test_file)), key="id")

  foo <- function(d){behavr::bin_apply_all(d,y = x)}
  attr(foo, "needed_columns") <- function(){
    "x"
  }
  foo
  a <- scopr:::parse_single_roi(data, FUN= foo, verbose = F)
  a[meta=T]

  attr(foo, "needed_columns") <- function(...){
    "www"
  }

  expect_error(scopr:::parse_single_roi(data, FUN= foo, verbose=F))

})

