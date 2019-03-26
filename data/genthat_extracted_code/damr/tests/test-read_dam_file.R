context("read_dam")

test_that("results match text file", {
  FILE <- damr_example("M064.txt")
  dt <- damr:::read_dam_file(FILE, start_datetime = "2017-06-30 14:45:00", stop_datetime = +Inf)
  dt[ xmv(region_id) == 15 & activity == 10]
  dt
  expect_equal(dt[t==10*60 & behavr::xmv(region_id)==15, activity], 10)
  expect_equal(dt[t==11*60 & behavr::xmv(region_id)==14, activity], 9)
})






test_that("load_dam works as expected on two files", {
  FILE <- damr_example("M064.txt")
  dt <- damr:::read_dam_file(FILE, start_datetime = "2017-06-30 14:45:00", stop_datetime = +Inf)

  dams_sample <- damr::read_dam_file( FILE,
                                       start_datetime = "2017-06-30 14:45:00")
  dams_sample
  testthat::expect_equal(unique(dams_sample[,unique(diff(t)), by=id]$V1), 60)

  suppressWarnings(
    dams_sample <- damr::read_dam_file( FILE,
                                       start_datetime = "2017-06-30 14:30:00")
  )
  mode <- function(x) {
    ux <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
  }
  testthat::expect_equal(mode(dams_sample[,diff(t), by=id]$V1), 60)
})
