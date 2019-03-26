context("10-RapData")

test_that("RapData", {
  # load data
  data(cs_pus, cs_spp, cs_space)
  # preliminary processing
  attribute.spaces <- AttributeSpaces(list(
    AttributeSpace(
      planning.unit.points = PlanningUnitPoints(
        rgeos::gCentroid(cs_pus[1:10, ], byid = TRUE)@coords, 1:10),
      demand.points = make.DemandPoints(sp::SpatialPoints(
        coords = randomPoints(cs_spp[[1]], n = 100, prob = TRUE))@coords),
      species = 1L)),
    name = "test_space")
  pu.species.probabilities <- calcSpeciesAverageInPus(cs_pus[1:10, ],
                                                      cs_spp[[1]])
  polygons <- SpatialPolygons2PolySet(cs_pus[1:10, ])
  boundary <- calcBoundaryData(cs_pus[1:10, ])
  # create object
  x <- RapData(pu = cs_pus@data[1:10, ],
               species = data.frame(name = "spp1"),
               targets = data.frame(species = 1L, target = c(0L, 1L),
                                    proportion = 0.2),
               pu.species.probabilities = pu.species.probabilities,
               attribute.spaces = list(attribute.spaces),
               polygons = polygons, boundary = boundary)
  # tests are implicit in the validity method when creating the object
  # execute basic methods
  x
  print(x)
  expect_true(methods::validObject(x, test = FALSE))
})

test_that("make.RapData (single species)", {
  # load data
  data(cs_pus, cs_spp, cs_space)
  # create object
  x <- make.RapData(cs_pus[1:10, ], cs_spp[[1]], cs_space,
                    include.geographic.space = TRUE)
  # check correct data is generated
  expect_equal(length(x@attribute.spaces), 2)
  expect_equal(x@attribute.spaces[[2]]@name, "geographic")
  expect_equal(length(x@attribute.spaces[[1]]@spaces), 1)
  for (i in seq_along(x@attribute.spaces[[1]]@spaces)) {
    expect_equal(nrow(x@attribute.spaces[[1]]@spaces[[i]]@demand.points@coords),
                 100)
    expect_equal(nrow(x@attribute.spaces[[1]]@spaces[[i]]@
                        planning.unit.points@coords),
                 10)
  }
  expect_equal(nrow(x@targets), 3)
  expect_equal(x@targets$species, c(1L, 1L, 1L))
  expect_equal(x@targets$target, 0:2)
  expect_equal(x@targets$proportion, c(0.2, 0.2, 0.2))
})

test_that("make.RapData (multiple species)", {
  # create RapUnsolved object
  set.seed(500)
  pus <- sim.pus(225L)
  spp <- lapply(c("uniform", "normal", "bimodal"), sim.species, n = 1, res = 1,
                x = pus)
  expect_warning({
    x <- make.RapData(pus, raster::stack(spp), NULL,
                      include.geographic.space = TRUE, n.demand.points = 200L,
                      amount.target = 0.1, space.target = -10)
  })
  # check correct data is generated
  expect_equal(length(x@attribute.spaces), 1)
  expect_equal(x@attribute.spaces[[1]]@name, "geographic")
  for (i in seq_along(x@attribute.spaces)) {
    a <- x@attribute.spaces[[i]]
    expect_equal(length(a@spaces), 3)
    for (j in seq_along(a@spaces)) {
      b <- a@spaces[[j]]
      expect_equal(nrow(b@demand.points@coords), 200)
      expect_equal(nrow(b@planning.unit.points@coords), 225)
    }
  }
  expect_equal(nrow(x@targets), 6)
  expect_equal(x@targets$species, rep(1:3, 2))
  expect_equal(x@targets$target, rep(0:1, each = 3))
  expect_equal(x@targets$proportion, rep(c(0.1, -10), each = 3))
})

test_that("pu.subset.RapData", {
  # create RapUnsolved object
  set.seed(500)
  data(sim_ru)
  rd <- sim_ru@data
  rd2 <- pu.subset(rd, 21:30)
  # tests
  expect_equal(nrow(rd2@pu), 10)
  expect_true(all(rd2@pu.species.probabilities$pu %in% 1:10))
  expect_true(all(rd2@boundary$id1 %in% 1:10))
  expect_true(all(rd2@boundary$id2 %in% 1:10))
  expect_true(all(rd2@polygons$PID %in% 1:10))
  expect_equal(nrow(rd2@attribute.spaces[[1]]@spaces[[1]]@
                      planning.unit.points@coords),
               10)
  expect_equal(rd2@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@ids,
               1:10)
})

test_that("spp.subset.RapData", {
  # create RapUnsolved object
  data(sim_ru)
  rd <- sim_ru@data
  rd2 <- spp.subset(rd, 1)
  rd3 <- spp.subset(rd, "uniform")
  rd4 <- spp.subset(rd, 3)
  # tests
  expect_true(validObject(rd2, test = FALSE))
  expect_equal(nrow(rd2@species), 1)
  expect_true(all(rd2@pu.species.probabilities$species == 1L))
  expect_equal(length(rd2@attribute.spaces[[1]]@spaces), 1)
  expect_true(all(rd2@targets$species == 1L))
  expect_equal(nrow(rd2@targets), 2)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points,
               rd2@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@demand.points,
               rd2@attribute.spaces[[1]]@spaces[[1]]@demand.points)

  expect_true(validObject(rd3, test = FALSE))
  expect_equal(nrow(rd3@species), 1)
  expect_true(all(rd3@pu.species.probabilities$species == 1L))
  expect_equal(length(rd3@attribute.spaces[[1]]@spaces), 1)
  expect_true(all(rd3@targets$species == 1L))
  expect_equal(nrow(rd3@targets), 2)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points,
               rd3@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@demand.points,
               rd3@attribute.spaces[[1]]@spaces[[1]]@demand.points)

  expect_true(validObject(rd4, test = FALSE))
  expect_equal(nrow(rd4@species), 1)
  expect_true(all(rd4@pu.species.probabilities$species == 1L))
  expect_equal(length(rd4@attribute.spaces[[1]]@spaces), 1)
  expect_true(all(rd4@targets$species == 1L))
  expect_equal(nrow(rd4@targets), 2)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[3]]@planning.unit.points,
               rd4@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[3]]@demand.points,
               rd4@attribute.spaces[[1]]@spaces[[1]]@demand.points)
})

test_that("spp.subset.RapData (sparse occupancy)", {
  rd <- sim_ru@data
  curr_pos <- sample(
    seq_along(rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@ids),
    ceiling(nrow(rd@pu) * 0.7))
  rd@attribute.spaces[[1]]@spaces[[1]] <- AttributeSpace(
    planning.unit.points = PlanningUnitPoints(
      coords = rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@
                 coords[curr_pos,, drop = FALSE],
      ids = rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@
              ids[curr_pos]),
    demand.points = rd@attribute.spaces[[1]]@spaces[[1]]@demand.points,
    species = rd@attribute.spaces[[1]]@spaces[[1]]@species)
  rd2 <- spp.subset(rd, 2)

  # tests
  expect_true(validObject(rd2, test = FALSE))
  expect_equal(nrow(rd2@species), 1)
  expect_true(all(rd2@pu.species.probabilities$species == 1L))
  expect_equal(length(rd2@attribute.spaces[[1]]@spaces), 1)
  expect_true(all(rd2@targets$species == 1L))
  expect_equal(nrow(rd2@targets), 2)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[2]]@planning.unit.points,
               rd2@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[2]]@demand.points,
               rd2@attribute.spaces[[1]]@spaces[[1]]@demand.points)
})


test_that("dp.subset.RapData", {
  # create RapUnsolved object
  data(sim_ru)
  rd <- sim_ru@data
  rd2 <- dp.subset(rd, 1, 1, 1:10)
  # tests
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@
                 coords[1:10, ],
               rd2@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords)
  expect_equal(rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights[1:10],
               rd2@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights)
})

test_that("prob.subset.RapData", {
  # create RapUnsolved object
  data(sim_ru)
  rd <- sim_ru@data
  rd2 <- prob.subset(rd, 1:3, c(0.1, 0.2, 0.7))
  # tests
  expect_true(all(rd2@pu.species.probabilities[[3]][
                    which(rd2@pu.species.probabilities[[1]] == 1)] > 0.1))
  expect_true(sum(rd2@pu.species.probabilities[[3]][
                    which(rd2@pu.species.probabilities[[1]] == 1)] < 0.7) > 1)
  expect_true(all(rd2@pu.species.probabilities[[3]][
                    which(rd2@pu.species.probabilities[[1]] == 2)] > 0.2))
  expect_true(sum(rd2@pu.species.probabilities[[3]][
                    which(rd2@pu.species.probabilities[[1]] == 2)] < 0.7) > 1)
  expect_true(all(rd2@pu.species.probabilities[[3]][
                    which(rd2@pu.species.probabilities[[1]] == 3)] > 0.7))
})

test_that("update.RapData", {
  # generate objects
  data(sim_ru)
  x <- sim_ru@data
  y <- update(x, name = c("a", "b", "c"), amount.target = c(0.1, 0.2, 0.3),
              space.target = c(0.4, 0.5, 0.6))
  z <- update(y, species = 1, name = "a1", amount.target = 0.9,
              space.target = 0.8)
  # y tests
  expect_equal(y@species$name, c("a", "b", "c"))
  expect_equal(y@targets$proportion[which(y@targets$target == 0)],
               c(0.1, 0.2, 0.3))
  expect_equal(y@targets$proportion[which(y@targets$target == 1)],
               c(0.4, 0.5, 0.6))
  # z tests
  expect_equal(z@species$name, c("a1", "b", "c"))
  expect_equal(z@targets$proportion[which(z@targets$target == 0)],
               c(0.9, 0.2, 0.3))
  expect_equal(z@targets$proportion[which(z@targets$target == 1)],
               c(0.8, 0.5, 0.6))
})


test_that("amount.target.RapData", {
  data(sim_ru)
  expect_equal(unname(amount.target(sim_ru@data)),
               rep(0.2, 3))
  expect_equal(unname(amount.target(sim_ru@data, 1)),
               0.2)
})

test_that("amount.target<-.RapData", {
  data(sim_ru)
  sim_rd <- sim_ru@data
  amount.target(sim_rd) <- 0.3
  expect_equal(unname(amount.target(sim_rd)), rep(0.3, 3))
  amount.target(sim_rd, 1) <- 0.5
  expect_equal(unname(amount.target(sim_rd)), c(0.5, 0.3, 0.3))
})

test_that("space.target.RapData", {
  data(sim_ru)
    expect_equal(unname(space.target(sim_ru@data)[, 1]),
                 rep(0.85, 3))
  expect_equal(unname(space.target(sim_ru@data, species = 1)[, 1]),
               0.85)
  expect_equal(unname(space.target(sim_ru@data, space = 1)[, 1]),
               rep(0.85, 3))
  expect_equal(unname(space.target(sim_ru@data, species = 1, space = 1)[, 1]),
               0.85)
})

test_that("space.target<-.RapData", {
  data(sim_ru)
  sim_rd <- sim_ru@data
  space.target(sim_rd) <- 0.3
  expect_equal(unname(space.target(sim_rd)[, 1]), rep(0.3, 3))
  space.target(sim_rd, 1) <- 0.5
  expect_equal(unname(space.target(sim_rd)[, 1]), c(0.5, 0.3, 0.3))
})

test_that("names.RapData", {
  data(sim_ru)
  expect_equal(names(sim_ru@data), sim_ru@data@species$names)
})

test_that("names<-.RapData", {
  data(sim_ru)
  sim_rd <- sim_ru@data
  names(sim_rd) <- c("spp1", "spp2", "spp3")
  expect_equal(names(sim_rd), c("spp1", "spp2", "spp3"))
})

test_that("spp.plot.RapData", {
  data(sim_ru)
  spp.plot(sim_ru@data, 1)
  spp.plot(sim_ru@data, "uniform")
  expect_true(TRUE)
})

test_that("space.plot.RapData", {
  data(sim_ru)
  space.plot(sim_ru@data, 1, 1)
  space.plot(sim_ru@data, "normal", 1)
  expect_true(TRUE)
})
