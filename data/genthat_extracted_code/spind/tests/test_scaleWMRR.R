context('scaleWMRR Tests')

test_that('scaleWMRR returns expected values', {
  skip_on_cran()
  data(carlinadata)
  coords<- carlinadata[,4:5]

  ms0<-scaleWMRR(carlina.horrida ~ aridity + land.use, family = "poisson",
                 data = carlinadata, coord = coords,
                 scale = 0, trace = F)

  gl0 <- glm(carlina.horrida ~ aridity + land.use, family = poisson(),
             data = carlinadata)

  expect_equal(as.vector(ms0$b), as.vector(gl0$coefficients),
               tolerance = 1e-4)
  expect_equal(as.vector(ms0$s.e.), as.vector(summary(gl0)$coefficients[ ,2]),
               tolerance = 1e-4)

  expect_match(class(ms0), 'list')

})

test_that('errors are correct',{
  skip_on_cran()
  data(carlinadata)
  coords <- cbind(200:dim(carlinadata)[1],200:dim(carlinadata)[1])

  expect_error(scaleWMRR(carlina.horrida ~ aridity + land.use,
                         family = "poisson",
                         data = carlinadata, coord = coords,
                         scale = 0, trace = F), 'error in dimension')

  coords <- cbind(seq(1,100, length.out = dim(carlinadata)[1]),
                  seq(1,100, length.out = dim(carlinadata)[1]))

  expect_error(scaleWMRR(carlina.horrida ~ aridity + land.use,
                         family = "poisson",
                         data = carlinadata, coord = coords,
                         scale = 0, trace = F), 'coordinates not integer')

})
