context("ring_vector")

test_that("basic", {
  load_ring_vector()
  set.seed(1)

  for (environment in c(TRUE, FALSE)) {
    for (type in names(sizes)) {
      v <- ring_vector(100, type, environment)
      if (!environment) {
        expect_equal(v$buf$stride(), sizes[[type]])
      }
      expect_equal(length(v), 0)

      n <- 3
      dat <- pool(type, n)

      expect_equal(v[], dat[integer(0)])

      expect_equal(head(v), dat[integer(0)])
      expect_equal(tail(v), dat[integer(0)])

      ring_vector_push(v, dat)

      expect_equal(ring_vector_get(v), dat)
      expect_equal(ring_vector_get(v, 1:2), dat[1:2])

      expect_equal(v[], dat[])
      expect_equal(v[1:2], dat[1:2])
      expect_equal(v[1], dat[1])

      idx <- sample(n, n * 3, TRUE)
      expect_equal(v[idx], dat[idx])

      expect_equal(length(v), n)
      expect_null(dim(v))
      expect_equal(head(v), dat)
      expect_equal(head(v, 1), dat[1])
      expect_equal(tail(v), dat)
      expect_equal(tail(v, 1), dat[n])

      v2 <- c(v, dat)
      expect_identical(v, v2) # reference
      expect_equal(length(v), n * 2)
      expect_equal(v[], c(dat, dat))

      v3 <- c(v, dat[n:1], dat[n])
      expect_equal(v[], c(dat, dat, dat[n:1], dat[n]))

      ## This does not work as expected, but that's because 'c' has
      ## different dispatch rules to rbind.
      ##   expect_equal(c(dat, v), c(dat, v[]))
    }
  }
})

test_that("S3", {
  load_ring_vector()
  v <- ring_vector(100, "integer")
  push(v, seq_len(4))
  expect_equal(length(v), 4)
})

test_that("indexing", {
  load_ring_vector()
  for (environment in c(TRUE, FALSE)) {
    for (type in names(sizes)) {
      n <- 100L
      m <- 20L
      v <- ring_vector(n, type, environment)
      dat <- pool(type, m)
      push(v, dat)

      i <- runif(m) < 0.5
      expect_equal(v[i], dat[i])

      i <- runif(m / 2) < 0.5
      expect_equal(v[i], dat[i])

      i <- runif(m * 2) < 0.5
      expect_equal(v[i], dat[i])

      i <- runif(m - 1) < 0.5
      expect_equal(v[i], dat[i])

      i <- sample(m, m / 2)
      expect_equal(v[i], dat[i])

      j <- -i
      expect_equal(v[j], dat[j])

      ## Mixed:
      expect_error(v[c(i, j)], "only 0's may be mixed with negative")

      k <- c(0, j)
      expect_equal(v[k], dat[k])

      expect_error(v["one"], "Invalid type for index")
    }
  }
})
