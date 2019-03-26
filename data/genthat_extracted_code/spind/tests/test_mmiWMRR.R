context('mmiWMRR')

test_that('outputs are as expected',{
  skip_on_cran()
  data(carlinadata)
  coords <- carlinadata[ ,4:5]


  wrm<- WRM(carlina.horrida ~ aridity + land.use, family = "poisson",
            data = carlinadata, coord = coords, level = 1,
            wavelet = "d4")

  mmi<- mmiWMRR(wrm, data = carlinadata, scale = 3,
                detail = TRUE, trace = FALSE)

  expect_equal(as.vector(mmi$result[ ,8]), c(1, 0, 0 ,0))
  expect_equal(as.vector(mmi$result[ ,7]), c(0, 38.68, 76.22, 116.06),
               tolerance = 1e-3)
  expect_equal(as.numeric(mmi$level), 3)

  mmi<- mmiWMRR(wrm, data = carlinadata, scale = 3,
                detail = FALSE, trace = FALSE)

  expect_equal(as.vector(mmi$result[ ,8]), c(1, 0, 0 ,0))
  expect_equal(as.vector(mmi$result[ ,7]), c(0, 58.63, 81.16, 98.41))

  expect_match(class(mmi), 'list')

})

