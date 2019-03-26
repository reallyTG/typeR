context("check if the fluxing functions add new links to the food web")
load("groups.level.RData")
test_that('zeros are stills zeros',{
  mat.fluxes = fluxing(groups.level$mat, 
                groups.level$biomasses, 
                0.71*groups.level$bodymasses, 
                groups.level$efficiencies)
  zero.flux = which(mat.fluxes == 0)
  zero.binary = which(groups.level$mat == 0)
  expect_equal(zero.flux, zero.binary)
}) 
