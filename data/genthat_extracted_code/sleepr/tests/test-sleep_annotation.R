context("sleep_annotation")

test_that("sleep_annotation works return expected results", {
  #rm(list=ls())
  data <- data.table::data.table(t=c(1:700), x=0.4)
  d_small <- sleep_annotation(data, motion_detector_FUN = virtual_beam_cross_detector)


  expect_equal(sum(d_small[,moving]), 0)

  data[t == 20, x:=0]
  d_small <- sleep_annotation(data, motion_detector_FUN = virtual_beam_cross_detector)
  expect_equal(sum(d_small[,moving]), 0)


  data[t == 20, x:=1]
  d_small <- sleep_annotation(data, motion_detector_FUN = virtual_beam_cross_detector)
  expect_equal(sum(d_small[,moving]), 1)


})


test_that("sleep_annotation works for single or multiple animals", {
  set.seed(1)
  met <- data.table::data.table(id = 1:5, condition=letters[1:5], sex=c("M","M","M","F", "F"), key="id")
  t <- 1:1000 * 0.5
  data <- met[,list(t = t,
                    x = rnorm(1000)),by="id"]

  first_animal <- sleep_annotation(data[id==1][, -"id", with=F], motion_detector_FUN = virtual_beam_cross_detector)
  manual_multi_nanimal <- data[, sleep_annotation(.SD, motion_detector_FUN = virtual_beam_cross_detector), by="id"]

  auto_multi_animal <- sleep_annotation(data, motion_detector_FUN = virtual_beam_cross_detector)

  auto_multi_animal

  expect_identical(
    auto_multi_animal,
    manual_multi_nanimal)

  expect_identical(
    auto_multi_animal[id==1][, -"id", with=F],
    first_animal)

})



test_that("sleep_annotation auto-fetches needed columns", {
  #rm(list=ls())
  data <- data.table::data.table(t=c(1:700), x=0.4)

  foo <- function(FUN = sleep_annotation,
                  columns = NULL, ...){


    if(is.null(columns) & !is.null(FUN)){
      needed_columns <- attr(FUN, "needed_columns")
      if(!is.null(needed_columns))
        columns <- needed_columns(...)
    }
    c("t", columns)
    }

  cols <- foo(motion_detector_FUN = virtual_beam_cross_detector)
  expect_identical(cols, c("t", "x"))

  cols <- foo(motion_detector_FUN = max_velocity_detector)
  expect_identical(cols, c("t", "xy_dist_log10x1000", "x", "has_interacted"))

})
