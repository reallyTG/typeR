context("Segmentation and segclust Testing")

test_that("Test of segmentation", {
  datalist = test_data()
  data <- datalist[["data"]]
  true_data_seg <- datalist[["true_data_seg"]]
  test_seg <- segmentation(data,Kmax = 10,lmin=5,scale.variable = T,type = "home-range",seg.var = c("x","y"))
  # test_seg <- segmentation(data,Kmax = 10,lmin=5,scale.variable = T,type = "home-range",seg.var = c("x","y"),subsample_over = 100)
  # plot(test_seg)
  test_res <- augment(test_seg)$state
  testthat::expect_equal(test_res, true_data_seg)
})

test_that("Test of segmentation/clustering", {
  # skip_on_cran()
  datalist = test_data()
  data <- datalist[["data"]]
  true_data_segclust <- datalist[["true_data_segclust"]]
  test_segclust <- segclust(data,Kmax = 10,lmin=5,ncluster = 3,scale.variable = T,type = "behavior",seg.var = c("x","y"),subsample_over = 1000)
  test_res <- augment(test_segclust)$state
  testthat::expect_equal(test_res, true_data_segclust)
})
