context("sleep_dam_annotation")

test_that("sleep_dam_annotation works", {
  set.seed(11)
  met <- data.table::data.table(id = 1:5, condition=letters[1:5], sex=c("M","M","M","F", "F"), key="id")
  t <- 1L:100L * 60L
  data <- met[,list(t = t,
                    activity = rnorm(100) > .7 ),by="id"]
  d <- behavr::behavr(data,met)

  sleep_d <- sleep_dam_annotation(d)

  expect_identical(
    sleepr:::sleep_contiguous(d[id==1]$activity > 0, fs=1/60)[1:95],
    sleep_d[id==1]$asleep[1:95])


  expect_identical(
    sleepr:::sleep_contiguous(d[id==5]$activity > 0, fs=1/60)[1:95],
    sleep_d[id==5]$asleep[1:95])

})

