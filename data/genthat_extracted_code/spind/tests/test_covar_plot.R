context('covar.plot')

data(carlinadata)
coords<- carlinadata[,4:5]

for.test<-covar.plot(carlina.horrida ~ aridity + land.use - 1,
                     carlinadata,coord=coords,wavelet="d4",
                     wtrafo='modwt',plot='covar')

test_that('covar output is expected', {
  skip_on_cran()
  expect_equal(as.vector(for.test$result[1, ]), c(0.0368, 0.0450, 0.0623,
                                                  0.0780, 0.0466),
               tolerance = 1e-5)
  expect_equal(as.vector(for.test$result[2, ]), c(0.4782, 0.1191, 0.0332,
                                                  0.0126, 0.0055))
  expect_identical(as.vector(attr(for.test$result, 'dimnames')[[1]]),
                   c('carlina.horrida-aridity','carlina.horrida-land.use'))

  expect_is(for.test$plot, 'ggplot')

})

library(ggplot2)

for.test<-covar.plot(carlina.horrida ~ aridity + land.use - 1,
                     carlinadata,coord=coords,wavelet="d4",
                     wtrafo='modwt',plot='var')

test_that('var output is expect',{
  skip_on_cran()
  expect_equal(as.vector(for.test$result[1, ]), c(0.7235, 0.1792, 0.0628,
                                                  0.0242, 0.0093),
               tolerance = 1e-5)
  expect_equal(as.vector(for.test$result[2, ]), c(0.0691, 0.1025, 0.2028,
                                                  0.3588, 0.2657),
               tolerance = 1e-5)
  expect_equal(as.vector(for.test$result[3, ]), c(0.7556, 0.1851, 0.0420,
                                                  0.0119, 0.0044),
               tolerance = 1e-5)
  expect_identical(as.vector(attr(for.test$result, 'dimnames')[[1]]),
                   c('carlina.horrida', 'aridity', 'land.use'))

  expect_is(for.test$plot, 'ggplot')

  expect_warning(covar.plot(carlina.horrida ~ aridity + land.use - 1,
                            carlinadata,coord=coords,wavelet="d4",
                            wtrafo='modwt',plot='var',
                            customize_plot = ggplot2::theme(legend.position = 'bottom')),
                 regexp = '"customize_plot" argument is now soft deprecated')
})