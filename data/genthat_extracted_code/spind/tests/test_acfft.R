context('acfft tests')

test_that('Outputs of acfft are correct',{
  skip_on_cran()
  data(musdata)
  coords <- musdata[ ,4:5]
  mglm <- glm(musculus ~ pollution + exposure, "poisson", musdata)

  dmax <- 10

  ac <- acfft(coords, resid(mglm, type = "pearson"),
              lim1 = 0, lim2 = 1, dmax = dmax)

  expect_equal(ac,c(0.685338504, 0.509680590, 0.363021118,
                    0.247398654, 0.144726020,  0.084220961, 0.050228656,
                    0.022369044, -0.001985639, -0.027296083),
               tolerance = 1e-7)
  expect_true(is.vector(ac))

  dmax <- 50
  ac <- acfft(coords, resid(mglm, type = "pearson"),
              lim1 = 0, lim2 = 1, dmax = dmax)

  expect_equal(length(ac), dmax)
})


test_that('Fails correctly',{
  skip_on_cran()
  data(musdata)
  coords <- musdata[ ,4:5]
  mglm <- glm(musculus ~ pollution + exposure, "poisson", musdata)

  coords <- cbind(round(runif(350)), round(runif(350)))

  expect_error(acfft(coords, resid(mglm, type = "pearson"),
                     lim1 = 0, lim2 = 1, dmax = dmax),
               "error in dimension")
})