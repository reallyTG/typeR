context('Scores of perfect forecasts')

test_that('Scores of perfect forecast is zero', {
  # perfect forecasts and observations for all forecast types
  ens = matrix(c(1,1,1, 2,2,2), byrow=TRUE, nrow=2)
  obs = c(1, 2)
  ens.bin = matrix(c(1,1,1, 0,0,0), byrow=TRUE, nrow=2)
  obs.bin = c(1, 0)
  ens.cat = matrix(c(3,3,3, 1,1,1), byrow=TRUE, nrow=2)
  obs.cat = c(3, 1)

  expect_equal(EnsBrier(ens.bin, obs.bin), c(0,0))
  expect_equal(EnsCrps(ens, obs), c(0,0))
  expect_equal(EnsQs(ens.cat, obs.cat), c(0,0))
  expect_equal(EnsRps(ens.cat, obs.cat), c(0,0))
  expect_equal(GaussCrps(obs, rep(0, length(obs)), obs), c(0,0))
})


