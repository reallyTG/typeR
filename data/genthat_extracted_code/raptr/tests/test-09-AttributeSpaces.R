context("09-AttributeSpaces")

test_that("AttributeSpaces generator function", {
  # load data
  data(cs_spp, cs_pus)
  sp1 <- AttributeSpace(
    planning.unit.points = PlanningUnitPoints(
      rgeos::gCentroid(cs_pus, byid = TRUE)@coords,
      seq_len(nrow(cs_pus))),
    demand.points = make.DemandPoints(
      sp::SpatialPoints(coords = randomPoints(cs_spp[[1]], n = 100,
                        prob = TRUE))@coords),
    species = 1L)
  sp2 <- AttributeSpace(
    planning.unit.points = PlanningUnitPoints(
      rgeos::gCentroid(cs_pus, byid = TRUE)@coords,
      seq_len(nrow(cs_pus))),
    demand.points = make.DemandPoints(
      sp::SpatialPoints(coords = randomPoints(cs_spp[[2]], n = 100,
                        prob = TRUE))@coords),
    species = 2L)
  # checks are internal
  sps1 <- AttributeSpaces(list(sp1, sp2), "test")
  print(sps1)
  expect_true(methods::validObject(sps1, test = FALSE))
})
