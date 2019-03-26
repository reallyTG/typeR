context('getVolumeUD')
test_that('volume ud on .UD', {
  ud <- new(".UD", raster(matrix(1:100 / sum(1:100))))
  expect_s4_class((v <- getVolumeUD(ud)), 'RasterLayer')
  expect_lte(max(values(v)), 1)
  expect_gte(max(values(v)), 0)
  expect_true(length(unique(values(
    getVolumeUD(new(".UD", raster(
      matrix(rep(1, 100) / sum(100))
    )))
  ))) == 1)
  expect_silent(r <- getVolumeUD(u <- new(".UD", raster(matrix(
    c(.95, .012, .011, .01, .009, .008)
  )))))
  expect_equal(values(r) < .95, c(T, F, F, F, F, F))
})
test_that('volume ud on .UDStack', {
  ud1 <- new(".UD", raster(matrix(1:100 / sum(1:100))))
  ud2 <- new(".UD", raster(matrix(100:1 / sum(1:100))))
  s <- UDStack(list(ud1, ud2))
  expect_equal(stack(getVolumeUD(ud1), getVolumeUD(ud2)),   getVolumeUD(s))
})
test_that('ud cant be negative', {
  r <- c(-.01, rnorm(99))
  r2 <- c(0, rnorm(99))
  
  expect_error(new(".UD", raster(matrix(ncol = 10, r / sum(
    r
  )))), 'The UD cant contain negative values')
  expect_error(new(".UDStack", stack(raster(matrix(
    r / sum(r)
  )), raster(matrix(
    r2 / sum(r2)
  )))),
  'The UDStack cant contain negative values')
})
test_that('randomized ud', {
  r <- abs(rnorm(100))
  ud <- new('.UD', raster(matrix(ncol = 10, r / sum(r))))
  v <- getVolumeUD(ud)
  expect_identical(rank(as.matrix(v)),
                   rank(-as.matrix(ud)))
  expect_identical(which.min(as.matrix(v)),
                   which.max(as.matrix(ud)))
})