# library(magrittr)
if (interactive()) library(testthat)

context("read_rrd")

rrd_cpu_0 <- system.file("extdata/cpu-0.rrd", package = "rrd")
rrd_content_1 <- system.file("extdata/content-1.rrd", package = "rrd")

is_list_of_tibbles <- function(x){
  is.list(x) && 
    all(
      vapply(x, 
             function(x)class(x)[1], 
             FUN.VALUE = character(1), 
             USE.NAMES = FALSE) == "tbl_df"
    )
}

test_that("describe_rrd", {
  
  expect_output(describe_rrd(rrd_cpu_0), "A RRD file with 10 RRA arrays and step size 60")
  capture.output(
    z <- (describe_rrd(rrd_cpu_0)) 
  )
  expect_is(z, "NULL")
})

test_that("deprecated functions", {
  
  expect_warning(importRRD(rrd_cpu_0), "'importRRD' is deprecated.")
  z <- suppressWarnings(
    importRRD(rrd_cpu_0)
    )
  expect_true(is_list_of_tibbles(z))
  
  expect_warning(importRRD(rrd_cpu_0, "MAX", start = Sys.time() - 86400, end = Sys.time(), step = 300L))
  z <- suppressWarnings(
    importRRD(rrd_cpu_0, "MAX", start = Sys.time() - 86400, end = Sys.time(), step = 300L)
  )
  expect_is(z, "tbl")
})



test_that("read_rrd rrd_cpu_0", {

  z <- read_rrd(rrd_cpu_0)
  expect_true(is_list_of_tibbles(z))
  expect_is(z[[1]], "data.frame")
  expect_equal(length(z), 10)
  expect_equal(
    names(z), 
    c("AVERAGE60", "AVERAGE300", "MIN300", "MAX300", "AVERAGE3600", 
      "MIN3600", "MAX3600", "AVERAGE86400", "MIN86400", "MAX86400")
  )
})

test_that("read_rrd rrd_content_1", {
  
  z <- read_rrd(rrd_content_1)
  expect_true(is_list_of_tibbles(z))
  expect_is(z[[1]], "data.frame")
  expect_equal(length(z), 10)
  expect_equal(
    names(z), 
    c("AVERAGE60", "AVERAGE300", "MIN300", "MAX300", "AVERAGE3600", 
      "MIN3600", "MAX3600", "AVERAGE86400", "MIN86400", "MAX86400")
  )
  
})

test_that("read_rra from rrd_content_1 using start time", {
  
  z <- read_rra(rrd_content_1, "MAX", start = Sys.time() - 86400, end = Sys.time(), step = 300L)
  expect_is(z, "data.frame")
  expect_equal(nrow(z), 288)
  expect_equal(ncol(z), 4)
  expect_equal(
    names(z), 
    c("timestamp", "sessions", "procs", "http")
  )
  
})

test_that("read_rra from rrd_content_1 using n_rows", {

  z <- read_rra(rrd_content_1, "MAX", n_steps = 10, end = Sys.time(), step = 300L)
  expect_is(z, "data.frame")
  expect_equal(nrow(z), 10)
  expect_equal(ncol(z), 4)
  expect_equal(
    names(z),
    c("timestamp", "sessions", "procs", "http")
  )

})
