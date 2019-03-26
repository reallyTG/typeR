context("ring_matrix")

test_that("basic use", {
  load_ring_matrix()
  set.seed(1)
  nc <- 5L

  for (environment in c(TRUE, FALSE)) {
    for (type in names(sizes)) {
      m <- ring_matrix(100, nc, type, environment)
      if (!environment) {
        expect_equal(m$buf$stride(), nc * sizes[[type]])
      }
      expect_equal(dim(m), c(0, nc))

      nr <- 3
      nn <- nr * m$nc
      dat <- matrix(pool(type, nr * m$nc), nr, m$nc)

      expect_equal(m[], dat[integer(0), ])

      expect_equal(head(m), dat[integer(0), ])
      expect_equal(tail(m), dat[integer(0), ])

      ring_matrix_push(m, dat)

      expect_equal(ring_matrix_get(m), dat)
      expect_equal(ring_matrix_get(m, 1:2), dat[1:2, , drop = FALSE])

      expect_equal(m[], dat[])
      expect_equal(m[, ], dat[, ])
      expect_equal(m[1:2, ], dat[1:2, ])
      expect_equal(m[1, ], dat[1, ])
      expect_equal(m[1, , drop = FALSE], dat[1, , drop = FALSE])
      expect_equal(m[, 1], dat[, 1])
      expect_equal(m[, 1, drop = FALSE], dat[, 1, drop = FALSE])

      idx <- cbind(sample(nrow(dat), nc, TRUE),
                   sample(ncol(dat), nc, TRUE))
      expect_equal(m[idx], dat[idx])

      expect_equal(dim(m), c(nr, nc))
      expect_equal(head(m), dat)
      expect_equal(head(m, 1), dat[1, , drop = FALSE])
      expect_equal(tail(m), dat)
      expect_equal(tail(m, 1), dat[nr, , drop = FALSE])

      expect_null(dimnames(m))
      expect_null(colnames(m))

      colnames(m) <- letters[1:nc]
      expect_equal(colnames(m), letters[1:nc])
      expect_equal(dimnames(m), list(NULL, letters[1:nc]))
      colnames(m) <- NULL
      expect_null(dimnames(m))
      expect_null(colnames(m))

      expect_error(rownames(m) <- letters[1:nr],
                   "Cannot set rownames of a ring matrix")
      expect_error(dimnames(m) <- list(letters[1:nr], letters[1:nc]),
                   "Cannot set rownames of a ring matrix")

      next
      ## These are disabled as they don't currently work as rbind is
      ## not a "real" S3 generic and has odd dispatch (possibly).
      m2 <- rbind(m, dat)
      expect_identical(m, m2) # reference
      expect_equal(nrow(m), nr * 2)
      expect_equal(as.matrix(m), rbind(dat, dat))

      m3 <- rbind(m, dat[nr:1, ], dat[nr, ])
      expect_equal(as.matrix(m), rbind(dat, dat, dat[nr:1, ], dat[nr, ]))

      expect_equal(rbind(dat, m), rbind(dat, as.matrix(m)))
    }
  }
})

test_that("S3", {
  load_ring_matrix()
  nc <- 5L
  m <- ring_matrix(100, nc, "integer")
  dat <- matrix(sample(as.integer(1:50), nc * 4), 4, nc)
  push(m, dat)
  expect_equal(length(m), length(dat))
  expect_equal(nrow(m), nrow(dat))
})

test_that("indexing", {
  load_ring_matrix()
  for (environment in c(TRUE, FALSE)) {
    for (type in names(sizes)) {
      n <- 100L
      nc <- 6L
      m <- 20
      mat <- ring_matrix(n, nc, type, environment)
      dat <- matrix(pool(type, m * nc), m, nc)
      push(mat, dat)

      i <- runif(m) < 0.5
      expect_equal(mat[i, ], dat[i, ])

      i <- runif(m / 2) < 0.5
      expect_equal(mat[i, ], dat[i, ])

      ## Interestingly, dat[i, ] throws an error here, being different
      ## to behaviour for the vector case...
      ##
      ## i <- runif(m * 2) < 0.5
      ## expect_equal(mat[i, ], dat[i, ])

      i <- runif(m - 1) < 0.5
      expect_equal(mat[i, ], dat[i, ])

      i <- sample(m, m / 2)
      expect_equal(mat[i, ], dat[i, ])

      j <- -i
      expect_equal(mat[j, ], dat[j, ])

      ## matixed:
      expect_error(mat[c(i, j)], "only 0's may be mixed with negative")

      k <- c(0, j)
      expect_equal(mat[k, ], dat[k, ])

      expect_error(mat["one", ], "Invalid type for index")
    }
  }
})
