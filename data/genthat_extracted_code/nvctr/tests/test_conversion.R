context("Conversion to/from n-vector")
library(nvctr)

test_that("basic conversion checks: lat, lon to n-vector", {
  expect_equal(
    lat_lon2n_E(0, 0), c(1, 0, 0))

  expect_equal(
    lat_lon2n_E(rad(1), rad(2)),
    c(0.99923861, 0.03489418, 0.01745241))

  expect_equal(
    lat_lon2n_E(rad(4), rad(5)),
    c(0.99376802, 0.08694344, 0.06975647))
})


test_that("basic conversion checks: n-vector to lat, lon", {
  expect_equal(
    n_E2lat_lon(c(1, 0, 0)),
    c(0, 0))

  expect_equal(
    n_E2lat_lon(c(0, 1, 0)),
    c(0, pi / 2))

  expect_equal(
    n_E2lat_lon(c(0, 0, 1)),
    c(pi / 2, pi))


  expect_equal(
    n_E2lat_lon(c(0.99923861, 0.03489418, 0.01745241)),
    c(rad(1), rad(2)))

  expect_equal(
    n_E2lat_lon(unit(c(5, 6, 7))),
    c(0.73074394, 0.87605805))

  expect_equal(
    n_E2lat_lon(unit(c(-5, 6, 7))),
    c(0.73074394, 2.2655346))

  expect_equal(
    n_E2lat_lon(unit(c(-5, 6, -7))),
    c(-0.73074394, 2.2655346))

  expect_equal(
    n_E2lat_lon(c(0.99376802, 0.08694344, 0.06975647)),
    c(rad(4), rad(5)))

})


test_that("Find R_EN", {
  n_EA_E <- lat_lon2n_E(rad(1), rad(2))
  result <- matrix(c(
    -1.74417749e-02, -3.48994967e-02, -9.99238615e-01,
    -6.09080201e-04,  9.99390827e-01, -3.48941813e-02,
     9.99847695e-01,  0.00000000e+00, -1.74524064e-02),
    nrow = 3, ncol = 3, byrow = TRUE)

  expect_equal(n_E2R_EN(n_EA_E), result)

  expect_equal(n_E2R_EN(c(0, 0, 1)),
               matrix(
                 c(-1, 0,  0,
                    0, 1,  0,
                    0, 0, -1),
                 nrow = 3, ncol = 3, byrow = TRUE))

})

test_that("Test xyz2R and R2xyz", {
  R_AB = xyz2R(rad(10), rad(20), rad(30))
  R_AB1 <- matrix(
    c(0.81379768, -0.46984631, 0.34202014,
      0.54383814, 0.82317294, -0.16317591,
      -0.20487413, 0.31879578, 0.92541658),
    nrow = 3, ncol = 3, byrow = TRUE)
  expect_equal(R_AB, R_AB1)

  R_AB = xyz2R(rad(-10), rad(20), rad(-30))
  R_AB1 <- matrix(
    c( 0.81379768,  0.46984631,  0.34202014,
      -0.54383814,  0.82317294,  0.16317591,
      -0.20487413, -0.31879578,  0.92541658),
    nrow = 3, ncol = 3, byrow = TRUE)
  expect_equal(R_AB, R_AB1)

  R_AB = xyz2R(rad(1), rad(-2), rad(-3))
  R_AB1 <- matrix(
    c( 0.9980212 ,  0.05230407, -0.0348995 ,
           -0.05293623,  0.99844556, -0.01744177,
            0.03393297,  0.01925471,  0.99923861),
    nrow = 3, ncol = 3, byrow = TRUE)
  expect_equal(R_AB, R_AB1)

  expect_equal(xyz2R(rad(1), rad(-2), rad(-3)) %>% R2xyz(),
               c(rad(1), rad(-2), rad(-3)))

  expect_equal(xyz2R(rad(1), rad(0), rad(1)) %>% R2xyz(),
               c(rad(1), rad(0), rad(1)))

  expect_equal(xyz2R(rad(-1), rad(2), rad(3)) %>% R2xyz(),
               c(rad(-1), rad(2), rad(3)))

})


test_that("Test zyx2R and R2zyx", {
  x <- rad(10)
  y <- rad(20)
  z <- rad(30)
  R_AB1 = zyx2R(z, y, x)
  R_AB = matrix(
    c(0.813798, -0.44097, 0.378522,
      0.469846, 0.882564, 0.018028,
      -0.34202, 0.163176, 0.925417),
    nrow = 3, ncol = 3, byrow = TRUE)
  expect_equal(R_AB, R_AB1, tolerance = 1e-5)

  zyx = R2zyx(R_AB1)
  expect_equal(c(x, y, z), c(zyx[3], zyx[2], zyx[1]), tolerance = 1e-5)

  expect_equal(zyx2R(rad(1), rad(-2), rad(-3)) %>% R2zyx(),
               c(rad(1), rad(-2), rad(-3)))

  expect_equal(zyx2R(rad(1), rad(0), rad(1)) %>% R2zyx(),
               c(rad(1), rad(0), rad(1)))

  expect_equal(zyx2R(rad(-1), rad(2), rad(3)) %>% R2zyx(),
               c(rad(-1), rad(2), rad(3)))

})

test_that("Test R_EL2n_E", {
  n_E <- c(0, 0, 1)

  R_EN <- n_E2R_EN(n_E)
  expect_equal(R_EN,
               matrix(
                 c(-1, 0,  0,
                    0, 1,  0,
                    0, 0, -1),
                 nrow = 3, ncol = 3, byrow = TRUE))

  n_E1 <- R_EL2n_E(R_EN)
  expect_equal(n_E, n_E1)

  n_E2 <- R_EN2n_E(R_EN)
  expect_equal(n_E, n_E2)

})

test_that("Test n_EB_E2p_EB_E", {
  lat_EB <- rad(1)
  lon_EB <- rad(2)
  h_EB <- 3

  # Find the vector p_EB_E ("ECEF-vector")

  # SOLUTION:
  # Step1: Convert to n-vector:
  n_EB_E  <- lat_lon2n_E(lat_EB, lon_EB)

  # Step2: Find the ECEF-vector p_EB_E:
  p_EB_E <- n_EB_E2p_EB_E(n_EB_E, -h_EB)

  expect_equal(p_EB_E,
    c(6373290.27721828,
       222560.20067474,
       110568.82718179))
})

test_that("Test n_EA_E_and_n_EB_E2p_AB_E", {
  lat_EA <- rad(1)
  lon_EA <- rad(2)
  z_EA   <- 3

  lat_EB <- rad(4)
  lon_EB <- rad(5)
  z_EB   <- 6

  n_EA_E <- lat_lon2n_E(lat_EA, lon_EA)
  n_EB_E <- lat_lon2n_E(lat_EB, lon_EB)

  p_AB_E <- n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB)

  expect_equal(p_AB_E,
    c(-34798.44233365,
      331985.66356208,
      331375.96424181))
})


test_that("Test p_EB_E2n_EB_E", {
  p_EB_E <- 6371e3 * c(0.9, -1, 1.1)

  n_EB_E <- p_EB_E2n_EB_E(p_EB_E)
  r <- n_EB_E[['n_EB_E']]
  expect_equal(r,
    c(0.51708896,
      -0.57454329,
       0.63444386))
  r <- n_EB_E[['z_EB']]
  expect_equal(r, -4702059.83429485)
})


test_that("Test n_EA_E_and_p_AB_E2n_EB_E", {
  # delta vector from B to C, decomposed in B is given:
  p_BC_B <- c(3000, 2000, 100)

  # Position and orientation of B is given:
  n_EB_E <- unit(c(1,2,3))  # unit to get unit length of vector
  z_EB <- -400
  R_NB  <- zyx2R(rad(10), rad(20), rad(30)) # yaw, pitch, and roll

  # A custom reference ellipsoid is given (replacing WGS-84):
  a <-  6378135
  f <- 1.0 / 298.26  # (WGS-72)

  R_EN <- n_E2R_EN(n_EB_E)
  R_EB <- R_EN %*% R_NB

  # Decompose the delta vector in E:
  p_BC_E <- (R_EB %*% p_BC_B) %>% as.vector() # no transpose of R_EB, since the vector is in B

  # Find the position of C, using the functions that goes from one
  # position and a delta, to a new position:
  n_EB_E <- n_EA_E_and_p_AB_E2n_EB_E(n_EB_E, p_BC_E, z_EB, a, f)
  r <- n_EB_E[['n_EB_E']]
  expect_equal(r,
    c(0.26679163,
      0.53435653,
      0.8020507)
  )
  r <- n_EB_E[['z_EB']]
  expect_equal(r, -406.00719607)
})


test_that("Test n_E and wander angle", {
  n_E <-  c(0, 0, 1)
  R_EL = n_E_and_wa2R_EL(n_E, wander_azimuth = (pi / 2))
  R_EL1 <- matrix(
    c( 0, -1,  0,
      -1,  0,  0,
       0,  0, -1),
    nrow = 3, ncol = 3, byrow = TRUE)
  expect_equal(R_EL, R_EL1)
})
