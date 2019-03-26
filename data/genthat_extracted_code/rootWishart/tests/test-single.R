context("Single Wishart")

x <- seq(0, 30, length.out = 50)

test_that("no error in single wishart", {
    y1 <- try(singleWishart(x, p = 5, n = 10),
                silent = TRUE)
    y2 <- try(singleWishart(x, p = 5, n = 10,
                            type = "double"),
              silent = TRUE)
    y3 <- try(singleWishart(x, p = 5, n = 10,
                            type = "multiple"),
              silent = TRUE)

    expect_false(inherits(y1, "try-error"))
    expect_false(inherits(y2, "try-error"))
    expect_false(inherits(y3, "try-error"))
})


