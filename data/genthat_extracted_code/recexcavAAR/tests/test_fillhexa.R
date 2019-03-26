context("Tests of function fillhexa")

hex <- data.frame(
  x = c(0,1,0,4,5,5,5,5),
  y = c(1,1,4,4,1,1,4,4),
  z = c(4,8,4,9,4,8,4,6)
)

res <- fillhexa(hex, 0.1)

test_that(
  "the output is a data.frame",  {
    expect_true(
      is.data.frame(res)
    )
  }
)

test_that(
  "the output has the correct amount of columns and colnames",  {
    expect_equal(
      ncol(res),
      3
    )
    expect_equal(
      colnames(res),
      c("x", "y", "z")
    )
  }
)

test_that(
  "the output contains just points within or close to the shape (indistinct test...)",  {

    # Idea: test if the distance between every point of a sample of
    # points from res and every corner point of the initial hexahedron
    # is bigger then the maximal corner point distances.
    # If so, then the tested points of res are wrongly placed.

    # determine size of sample (10% of res)
    samp <- round(nrow(res)/10, 0)

    # get sample and add it to hex
    hex2 <- rbind(hex, res[sample(nrow(res), samp), ])

    # calculate dist matrix (distance between all points among themselves)
    d2 <- as.matrix(dist(hex2))

    # determine if point distances are within or at least close to the
    # corner point limits
    # result is a boolean vector with info for every corner point
    # if one is false, then something is wrong
    t <- c()
    for (i in 1:8) {
      t[i] <- max(d2[1:8,i]) >= max(d2[i,9:(8+samp)])
    }

    expect_true(
      all(t)
    )

  }
)