library(DSsim)
library(testthat)

context("Systematic Point Transect Simulation Checks")

test_that("Defaults work as expected", {
  
  
  coords <- gaps <- list()
  coords[[1]] <- list(data.frame(x = c(0, 0 , 1000, 1000, 0), 
                                 y = c(0, 1000, 1000, 0, 0))) 
  gaps[[1]] <- list()
  
  region <- make.region("region", coords = coords, gaps = gaps, units = "km")
  region2 <- make.region(coords = coords, units = "km")
  expect_that(region2, is_identical_to(region))
  
  density <- make.density(region, x.space = 5, y.space = 5, constant = 10)
  density2 <- make.density(region, x.space = 5, constant = 10)
  expect_that(density2, is_identical_to(density))
  
  pop.desc <- make.population.description(region, density, N = 2000)
  
  detect <- make.detectability("hn", scale.param = 20, truncation = 60)
  detect2 <- make.detectability(scale.param = 20, truncation = 60)
  expect_that(detect2, is_identical_to(detect))
  
  design <- make.design("point", "systematic", spacing = 100, design.axis = 0)
  design2 <- make.design("point", "systematic")
  expect_that(design2, is_identical_to(design))
  
  transects <- generate.transects(design, region = region)
  expect_that(nrow(transects@sampler.info), equals(100))
  
  analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn", formula = ~1)), method = "ds", truncation = 60)
  analyses2 <- make.ddf.analysis.list(truncation = 60)
  expect_that(analyses2, equals(analyses))
  
  sim <- make.simulation(1, region.obj = region, population.description.obj = pop.desc, detectability.obj = detect, design.obj = design, ddf.analyses.list = analyses)
  sim2 <- make.simulation(1, region.obj = region, population.description.obj = pop.desc, detectability.obj = detect, design.obj = design, ddf.analyses.list = analyses2)
  
  set.seed(747)
  test <- create.survey.results(sim, TRUE)
  set.seed(747)
  test2 <- create.survey.results(sim2, TRUE)
  expect_that(test2, is_identical_to(test))
  expect_that(nrow(test@population@population), equals(2000))
  
  set.seed(242)
  test.analysis <- run.analysis(sim, test, dht = TRUE)
  set.seed(242)
  test.analysis2 <- run.analysis(sim2, test2, dht = TRUE)
  expect_that(test.analysis2$ddf$data, is_identical_to(test.analysis$ddf$data))
  expect_that(test.analysis2$ddf$par, is_identical_to(test.analysis$ddf$par))
  expect_that(test.analysis2$dht$individuals$N, is_identical_to(test.analysis$dht$individuals$N))
  expect_that(test.analysis$dht$individuals$N$Estimate, is_less_than(2000))
  expect_that(test.analysis$dht$individuals$N$Estimate, is_more_than(1999))

})
  