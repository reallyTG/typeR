context("13-rap")

test_that("rap (unreliable - default RapOpts and GurobiOpts - solve=FALSE)", {
  # load data
  set.seed(500)
  data(cs_pus, cs_spp)
  cs_pus <- cs_pus
  # run function
  cs_ru <- rap(pus = cs_pus[1:10, ],
               species = cs_spp,
               formulation = "unreliable",
               amount.target = 0.2,
               space.target = -10000,
               n.demand.points = 3L,
               include.geographic.space = TRUE,
               solve = FALSE)
  # check correct parameters
  expect_is(cs_ru@opts, "RapUnreliableOpts")

  expect_equal(nrow(cs_ru@data@species),
               raster::nlayers(cs_spp))
  expect_equal(length(cs_ru@data@attribute.spaces), 1)
  expect_equal(cs_ru@data@attribute.spaces[[1]]@name, "geographic")
  expect_equal(length(cs_ru@data@attribute.spaces[[1]]@spaces),
               raster::nlayers(cs_spp))
  for (i in seq_along(cs_ru@data@attribute.spaces[[1]]@spaces)) {
    x <- cs_ru@data@attribute.spaces[[1]]@spaces[[i]]
    expect_equal(nrow(x@demand.points@coords), 3)
    expect_equal(nrow(x@planning.unit.points@coords), 10)
  }

  expect_equal(nrow(cs_ru@data@targets), 8)
  expect_equal(cs_ru@data@targets$species, rep(1:4, 2))
  expect_equal(cs_ru@data@targets$target, rep(0:1, each = 4))
  expect_equal(cs_ru@data@targets$proportion, rep(c(0.2, -10000), each = 4))
})

test_that(paste0("rap (unreliable - default RapOpts and GurobiOpts and ",
                 "sparse occupancy - solve=FALSE)"), {
  # load data
  set.seed(500)
  data(cs_pus, cs_spp)
  cs_pus <- cs_pus
  # run function
  cs_ru <- rap(pus = cs_pus,
               species = cs_spp,
               spaces = cs_space,
               formulation = "unreliable",
               amount.target = 0.2,
               space.target = 0.1,
               n.demand.points = 3L,
               include.geographic.space = TRUE,
               solve = FALSE,
               verbose = TRUE)
  # check correct parameters
  expect_is(cs_ru@opts, "RapUnreliableOpts")

  expect_equal(nrow(cs_ru@data@species), raster::nlayers(cs_spp))
  expect_equal(length(cs_ru@data@attribute.spaces), 2)
  expect_equal(cs_ru@data@attribute.spaces[[2]]@name, "geographic")
  expect_equal(length(cs_ru@data@attribute.spaces[[1]]@spaces),
               raster::nlayers(cs_spp))
  for (i in seq_along(cs_ru@data@attribute.spaces[[1]]@spaces)) {
    x <- cs_ru@data@attribute.spaces[[1]]@spaces[[i]]
    expect_equal(nrow(x@demand.points@coords), 3)
  }

  expect_equal(nrow(cs_ru@data@targets), 12)
  expect_equal(cs_ru@data@targets$species, rep(1:4, 3))
  expect_equal(cs_ru@data@targets$target, rep(0:2, each = 4))
  expect_equal(cs_ru@data@targets$proportion, rep(c(0.2, 0.1, 0.1), each = 4))
})


test_that("rap (unreliable - custom RapOpts and GurobiOpts - solve=TRUE)", {
  if (!is.GurobiInstalled(FALSE))
    skip("Gurobi not installed on system")
  # load data
  set.seed(500)
  data(cs_pus, cs_spp)
  cs_pus <- cs_pus[1:10, ]
  # run function
  expect_warning({
    cs_rs <- rap(pus = cs_pus,
                 species = cs_spp,
                 formulation = "unreliable",
                 amount.target = 0.2,
                 space.target = -100000,
                 n.demand.points = 3L,
                 include.geographic.space = TRUE,
                 MIPGap = 0.9,
                 BLM = 100)
  })
  # check calculations
  expect_true(all(space.held(cs_rs) >= -100000))
  expect_true(all(space.held(cs_rs) <= 1))
  expect_true(all(amount.held(cs_rs) >= 0.2))
  expect_true(all(amount.held(cs_rs) <= 1))
  expect_equal(cs_rs@opts@BLM, 100)
})

test_that("rap (reliable - default RapOpts and GurobiOpts - solve=FALSE)", {
  # laod data
  set.seed(500)
  data(cs_pus, cs_spp)
  cs_pus <- cs_pus[1:10, ]
  # run function
  cs_ru <- rap(pus = cs_pus,
               species = cs_spp,
               formulation = "reliable",
               n.demand.points = 5L,
               amount.target = 0.2,
               space.target = -10000,
               include.geographic.space = TRUE,
               verbose = TRUE,
               solve = FALSE)

  # check correct parameters
  expect_is(cs_ru@opts, "RapReliableOpts")

  expect_equal(nrow(cs_ru@data@species), raster::nlayers(cs_spp))

  expect_equal(length(cs_ru@data@attribute.spaces), 1)
  expect_equal(cs_ru@data@attribute.spaces[[1]]@name, "geographic")
  expect_equal(length(cs_ru@data@attribute.spaces[[1]]@spaces), 4)
  for (i in seq_along(cs_ru@data@attribute.spaces[[1]]@spaces)) {
    x <- cs_ru@data@attribute.spaces[[1]]@spaces[[i]]
    expect_equal(nrow(x@demand.points@coords), 5)
    expect_equal(nrow(x@planning.unit.points@coords), 10)
  }

  expect_equal(nrow(cs_ru@data@targets), 8)
  expect_equal(cs_ru@data@targets$species, rep(1:4, 2))
  expect_equal(cs_ru@data@targets$target, rep(0:1, each = 4))
  expect_equal(cs_ru@data@targets$proportion, rep(c(0.2, -10000), each = 4))
})

test_that("rap (reliable - custom RapOpts and GurobiOpts - solve=TRUE)", {
  if (!is.GurobiInstalled(FALSE))
    skip("Gurobi not installed on system")
  # load data
  set.seed(500)
  data(cs_pus, cs_spp)
  cs_pus <- cs_pus[1:10, ]
  # run function
  expect_warning({
    cs_rs <- rap(pus = cs_pus,
                 species = cs_spp,
                 formulation = "reliable",
                 amount.target = 0.2,
                 space.target = -10000,
                 n.demand.points = 3L,
                 include.geographic.space = TRUE,
                 MIPGap = 0.9,
                 BLM = 100)
  })
  # check calculations
  expect_true(all(space.held(cs_rs) >= -10000))
  expect_true(all(amount.held(cs_rs) >= 0.2))
  expect_true(all(amount.held(cs_rs) <= 1))
  expect_equal(cs_rs@opts@BLM, 100)
})
