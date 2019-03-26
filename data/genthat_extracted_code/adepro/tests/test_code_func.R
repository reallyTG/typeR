library(adepro)
context("functionality")

test_that("initQ", {
  Q <- initQ(ae_data)
  expect_true(is.data.frame(Q) | is.matrix(Q))
  expect_true(all(Q %in% c("TRUE", "FALSE")))
  expect_equal(nrow(ae_data), nrow(Q))
})

test_that("check_data", {
  expect_silent(check_data(ae_data, patient_data))
})

test_that("set_vector_layout", {
  vec_lay <- set_vector_layout(patient_data, height=12)
  expect_true(is.vector(vec_lay) & is.numeric(vec_lay))
  expect_equal(nrow(patient_data), max(vec_lay))
  expect_equal(vec_lay[which(vec_lay != 0)], 1:nrow(patient_data))
})

test_that("set_group_lines", {
  grp_l <- set_group_lines(patient_data, height = 12)
  n_trt <- length(unique(patient_data$treat))
  expect_equal(length(grp_l), 3)
  expect_equal(n_trt-1, ncol(grp_l[[1]]))
  expect_equal(n_trt-1, ncol(grp_l[[2]]))
  expect_equal(2*(n_trt-1), length(grp_l[[3]]))
})

test_that("set_width", {
  width <- set_width(patient_data, height=12)
  expect_true(is.numeric(width))
  expect_true(all(width == 1))
  expect_true(length(width) > 0)
})

test_that("set_global_params", {
  global <- set_global_params(ae_data, patient_data)
  Q <- initQ(ae_data)
  height <- global$height
  width <- set_width(patient_data, height=height)
  grp_l <- set_group_lines(patient_data, height=height)
  glb_names <- c("titles", "footnote", "Q", "AE_options", "width", "height", "xlines", "ylines", "plines")
  expect_equal(names(global), glb_names)
  expect_equal(Q, global$Q)
  expect_equal(width, global$width)
  expect_equal(grp_l[[1]], global$xlines[[1]])
  expect_equal(grp_l[[2]], global$ylines[[1]])
  expect_equal(grp_l[[3]], global$plines[[1]])
})

test_that("preproc_ae", {
  ae_data_n <- preproc_ae(ae_data)
  expect_equal(ae_data[,1:5], ae_data_n[,1:5])
  expect_true(all(ae_data_n$r >= 0 & ae_data_n$r <= 1))
  expect_true(all(is.na(ae_data_n$d)))
})

test_that("preproc_patients", {
  patient_n <- preproc_patients(patient_data, height = 12)
  expect_equal(patient_data, patient_n[,1:4])
  expect_equal(names(patient_n)[5:6], c("X", "Y"))
  expect_equal(patient_n$X, sort(patient_n$X))
  expect_true(all(patient_n$Y < 0))
  expect_true(min(abs(diff(patient_n$Y)))==2)
})

test_that("ae_count", {
  count <- ae_count(ae_data, patient_data)
  n_trt <- length(unique(count$treat))
  expect_true(is.data.frame(count))
  expect_true(ncol(count)==3)
  expect_equal(colnames(count), c("day", "treat", "freq"))
  expect_equal(nrow(count), n_trt*max(count$day))
  expect_true(is.numeric(count$freq))
  expect_true(all(count$freq >= 0 & count$freq <=  4))
})


test_that("add.slice", {
  plot(0, 0)
  expect_silent(add.slice(no=1, r=0.5, nop=8, pos.x=0, pos.y=0))
})

test_that("piechart", {
  plot(0, 0)
  expect_silent(piechart(radii=c(0.3, 0.1, 0.2), nos=1:3))
})


test_that("piecharts", {
  plot(0, 0)
  d_data <- ae_data[which(ae_data$day_start == 1),]
  ae_data_new <- cbind(ae_data, d=rep(0, nrow(ae_data)))
  vars <- unique(ae_data$ae)[1:8]
  expect_silent(piecharts(i=2, aes=vars, ae_data=ae_data_new, d_data=d_data,
                          patients=patient_data, xlines=1, ylines=1))
})

test_that("pie_legend", {
  plot(0, 0)
  vars <- unique(ae_data$ae)[1:8]
  expect_silent(pie_legend(aes=vars))
})



