context("08-AttributeSpace")

test_that("AttributeSpace generator function", {
  # load data
  data(cs_spp, cs_pus)
  x <- AttributeSpace(
    planning.unit.points = PlanningUnitPoints(
      rgeos::gCentroid(cs_pus, byid = TRUE)@coords,
      seq_len(nrow(cs_pus@data))),
    demand.points = make.DemandPoints(
      points = randomPoints(cs_spp[[1]], n = 100, prob = TRUE)),
    species = 1L)
  # checks are internal
  print(x)
  expect_true(methods::validObject(x, test = FALSE))
})
