context('rvi.plot')

data(carlinadata)
coords<- carlinadata[,4:5]

# Plot scale-dependent relative variable importanc
for.test <-rvi.plot(carlina.horrida ~ aridity + land.use, "poisson",
                    carlinadata, coords, maxlevel = 4,
                    detail = TRUE, wavelet = "d4")

library(ggplot2)

test_that("outputs are as expected", {
  skip_on_cran()
  expect_equal(as.vector(for.test$rvi[1, ]), c(0.005, 1 ,1 ,1),
               tolerance = 1e-5)
  expect_equal(as.vector(for.test$rvi[2, ]), c(1, 1, 1, 0),
               tolerance = 1e-5)
  expect_true(is.list(for.test))

  expect_is(for.test$plot, 'ggplot')

  expect_warning(rvi.plot(carlina.horrida ~ aridity + land.use, "poisson",
                          carlinadata, coords, maxlevel = 4,
                          detail = TRUE, wavelet = "d4",
                          customize_plot = ggplot2::theme(legend.position = 'top')),
                 regexp = '"customize_plot" argument is now soft deprecated')


})

test_that('trace argument works', {
  skip_on_cran()
  expect_output(rvi.plot(carlina.horrida ~ aridity + land.use, "poisson",
                         carlinadata, coords, maxlevel = 4,
                         detail = TRUE, trace = TRUE, wavelet = "d4"),
                "Model selection tables:")

  expect_output(rvi.plot(carlina.horrida ~ aridity + land.use, "poisson",
                         carlinadata, coords, maxlevel = 4,
                         detail = TRUE, trace = TRUE, wavelet = "d4"),
                "Relative variable importance:")
})