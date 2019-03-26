library(qfasar)
context("Test dimac algorithm")


# Distance measure equals 1
test_obj <- dimac(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                  0.04, 0.11, 0.29, 0.56,
                                  0.10, 0.05, 0.35, 0.50,
                                  0.12, 0.03, 0.37, 0.48,
                                  0.10, 0.06, 0.35, 0.49,
                                  0.05, 0.15, 0.35, 0.45), ncol=6),
                  id = c("ID_1", "ID_2", "ID_3", "ID_4", "ID_5", "ID_6"),
                  type = c("Type_1", "Type_2", "Type_3"),
                  loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                  dist_meas = 1)

test_that("Distance measure 1",{
  expect_equivalent(round(test_obj$clust_dist[1,], 3),
                    c(0.235, 0.524, 1.160))
})


# Distance measure equals 2
test_obj <- dimac(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                  0.04, 0.11, 0.29, 0.56,
                                  0.10, 0.05, 0.35, 0.50,
                                  0.12, 0.03, 0.37, 0.48,
                                  0.10, 0.06, 0.35, 0.49,
                                  0.05, 0.15, 0.35, 0.45), ncol=6),
                  id = c("ID_1", "ID_2", "ID_3", "ID_4", "ID_5", "ID_6"),
                  type = c("Type_1", "Type_2", "Type_3"),
                  loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                  dist_meas = 2)

test_that("Distance measure 2",{
  expect_equivalent(round(test_obj$clust_dist[1,], 3),
                    c(0.002, 0.008, 0.060))
})


# Distance measure equals 3, gamma equals 0.5
test_obj <- dimac(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                  0.04, 0.11, 0.29, 0.56,
                                  0.10, 0.05, 0.35, 0.50,
                                  0.12, 0.03, 0.37, 0.48,
                                  0.10, 0.06, 0.35, 0.49,
                                  0.05, 0.15, 0.35, 0.45), ncol=6),
                  id = c("ID_1", "ID_2", "ID_3", "ID_4", "ID_5", "ID_6"),
                  type = c("Type_1", "Type_2", "Type_3"),
                  loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                  dist_meas = 3,
                  gamma = 0.5)

test_that("Distance measure 3, gamma 0.5",{
  expect_equivalent(round(test_obj$clust_dist[1,], 3),
                    c(0.176, 0.376, 0.922))
})


# Distance measure equals 3, default gamma
test_obj <- dimac(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                  0.04, 0.11, 0.29, 0.56,
                                  0.10, 0.05, 0.35, 0.50,
                                  0.12, 0.03, 0.37, 0.48,
                                  0.10, 0.06, 0.35, 0.49,
                                  0.05, 0.15, 0.35, 0.45), ncol=6),
                  id = c("ID_1", "ID_2", "ID_3", "ID_4", "ID_5", "ID_6"),
                  type = c("Type_1", "Type_2", "Type_3"),
                  loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                  dist_meas = 3)

test_that("Distance measure 3, default gamma",{
  expect_equivalent(round(test_obj$clust_dist[1,], 3),
                    c(0.122, 0.251, 0.688))
})

