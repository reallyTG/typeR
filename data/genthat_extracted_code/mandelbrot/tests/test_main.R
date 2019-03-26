context("Mandelbrot interfaces")

test_that("mandebrot generates correct results", {

  # range in set
  for (iter in c(10, 100, 250)) {
    mb <- as.data.frame(mandelbrot(iterations = iter))

    # test point <0, 0>
    x0y0 <- mb[mb$y > -.01 & mb$y < .01 & mb$x > -.01 & mb$x < .01,]

    # iter +1 == never goes to inf / >2
    expect_equal(unique(x0y0$value), iter + 1)
  }

  # range outside set
  for (iter in c(10, 100, 250)) {
    mb <- as.data.frame(mandelbrot(iterations = iter))

    # test point <1, 1>
    x1y1 <- mb[mb$y > .99 & mb$y < 1.01 & mb$x > .99 & mb$x < 1.01,]

    # not in the set + goes >2 at 2
    expect_lt(unique(x1y1$value), iter)
    expect_equal(unique(x1y1$value), 2)
  }

})

test_that("mandelbrot and mandelbrot0 give the same results", {

  mb1 <- as.data.frame(mandelbrot())
  mb2 <- mandelbrot0()

  expect_equal(mb1, mb2)

  low_res <- 100
  mb1 <- as.data.frame(mandelbrot(resolution = low_res))
  mb2 <- mandelbrot0(resolution = low_res)

  expect_equal(mb1, mb2)

})

test_that("mandelbrot0 won't write uneven x/y resolutions", {
  uneven_res <- list(x = 400, y = 200)
  expect_error(mandelbrot0(resolution = uneven_res))
})

