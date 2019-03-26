context("get_dists")

test_that(
  "invalid inputs produce an error",
  {
    # When i is a matrix.
    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- "a"
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      get_dists(test_dists, indices)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[1] <- -3
      get_dists(test_dists, indices)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[3] <- 25
      get_dists(test_dists, indices)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      get_dists(test_dists, NULL)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      get_dists(test_dists, indices, return_indices = NULL)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      get_dists(test_dists, indices, return_indices = "banana")
    })

    # When j is used.
    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- "a"
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      i[1] <- "a"
      j <- indices[,2]
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[1] <- -3
      i <- indices[,1]
      j <- indices[,2]
      j[1] <- "a"
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- "a"
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      i[1] <- -3
      j <- indices[,2]
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[1] <- -3
      i <- indices[,1]
      j <- indices[,2]
      j[1] <- -3
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- "a"
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      i[1] <- 100
      j <- indices[,2]
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[1] <- -3
      i <- indices[,1]
      j <- indices[,2]
      j[1] <- 100
      get_dists(test_dists, i, j)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      get_dists(test_dists, i, j, return_indices = NULL)
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      get_dists(test_dists, i, j, return_indices = "banana")
    })

    expect_error({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      get_dists(test_dists, i, c(j, 1))
    })
  }
)

test_that(
  "valid inputs produce valid output",
  {
    # When i is a matrix.
    expect_true({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      all(get_dists(test_dists, indices) == test_dists[c(1,15)])
    })

    expect_true({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,1,2,2,3,3,4,4), ncol = 2, byrow = TRUE)
      all(get_dists(test_dists, indices) == 0)
    })

    expect_silent({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      get_dists(test_dists, indices, return_indices = TRUE)
    })

    expect_silent({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      get_dists(test_dists, indices, return_indices = FALSE)
    })

    # When j is used.
    expect_true({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      indices[,1] <- 1:2
      indices[,2] <- indices[,1]
      i <- indices[,1]
      j <- indices[,2]
      all(get_dists(test_dists, indices) == 0)
    })

    expect_true({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      all(get_dists(test_dists, i, j) == test_dists[c(1,15)])
    })

    expect_silent({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      get_dists(test_dists, i, j, return_indices = TRUE)
    })

    expect_silent({
      test <- matrix(c(rnorm(10), rnorm(10)-5, rnorm(10)+5), ncol = 2)
      test_dists <- dist(test)
      indices <- matrix(c(1,2,3,2), ncol = 2, byrow = TRUE)
      i <- indices[,1]
      j <- indices[,2]
      get_dists(test_dists, i, j, return_indices = FALSE)
    })
  }
)



