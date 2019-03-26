context("snf")


test_that("snf(mat)", {
  skip_on_cran()

  stop_m2()
  start_m2()

  M <- matrix(c(
       1,    2,    3,
       1,   34,   45,
    2213, 1123, 6543,
       0,    0,    0
  ), nrow = 4, byrow = TRUE)

  actual <- snf(M)

  expect <- list(
    D = m2_structure(
      matrix(c(
        135654L, 0L, 0L,
        0L, 1L, 0L,
        0L, 0L, 1L,
        0L, 0L, 0L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$D),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    P = m2_structure(
      matrix(c(
        1L, 33471L, -43292L, 0L,
        0L, 1L, 0L, 0L,
        0L, 0L, 1L, 0L,
        0L, 0L, 0L, 1L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$P),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    Q = m2_structure(
      matrix(c(
        171927L, -42421L,  54868L,
        93042L, -22957L,  29693L,
        -74119L,  18288L, -23654L
      ), nrow = 3, byrow = TRUE),
      m2_name = m2_name(actual$Q),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    )
  )

  expect_equal(actual, expect)

  # this is testing M2 more than m2r, skipping
  #
  # # decomposition
  # expect_equal(D, P %*% M %*% Q)
  #
  # # unitary
  # expect_equal(abs(det(P)), 1)
  # expect_equal(abs(det(Q)), 1)
  #
  # # D is diag
  # expect_equal(
  #   D,
  #   rbind(diag(diag(D)), matrix(0L, ncol = ncol(D), nrow = nrow(D) - length(diag(D))))
  # )

})











test_that("snf(m2_matrix(mat))", {
  skip_on_cran()

  M <- matrix(c(
       1,    2,    3,
       1,   34,   45,
    2213, 1123, 6543,
       0,    0,    0
  ), nrow = 4, byrow = TRUE)

  actual <- snf(m2_matrix(M))

  expect <- list(
    D = m2_structure(
      matrix(c(
        135654L, 0L, 0L,
        0L, 1L, 0L,
        0L, 0L, 1L,
        0L, 0L, 0L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$D),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    P = m2_structure(
      matrix(c(
        1L, 33471L, -43292L, 0L,
        0L, 1L, 0L, 0L,
        0L, 0L, 1L, 0L,
        0L, 0L, 0L, 1L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$P),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    Q = m2_structure(
      matrix(c(
        171927L, -42421L,  54868L,
        93042L, -22957L,  29693L,
        -74119L,  18288L, -23654L
      ), nrow = 3, byrow = TRUE),
      m2_name = m2_name(actual$Q),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    )
  )

  expect_equal(actual, expect)

})








test_that("snf(m2_matrix.(mat))", {
  skip_on_cran()

  M <- matrix(c(
       1,    2,    3,
       1,   34,   45,
    2213, 1123, 6543,
       0,    0,    0
  ), nrow = 4, byrow = TRUE)

  actual <- snf(m2_matrix.(M))

  expect <- list(
    D = m2_structure(
      matrix(c(
        135654L, 0L, 0L,
        0L, 1L, 0L,
        0L, 0L, 1L,
        0L, 0L, 0L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$D),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    P = m2_structure(
      matrix(c(
        1L, 33471L, -43292L, 0L,
        0L, 1L, 0L, 0L,
        0L, 0L, 1L, 0L,
        0L, 0L, 0L, 1L
      ), nrow = 4, byrow = TRUE),
      m2_name = m2_name(actual$P),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    ),
    Q = m2_structure(
      matrix(c(
        171927L, -42421L,  54868L,
        93042L, -22957L,  29693L,
        -74119L,  18288L, -23654L
      ), nrow = 3, byrow = TRUE),
      m2_name = m2_name(actual$Q),
      m2_class = "m2_matrix",
      m2_meta = list(ring = coefring_as_ring("ZZ")),
      base_class = "matrix"
    )
  )

  expect_equal(actual, expect)

})













