library(mrds)
library(testthat)

context("Testing mrds options successfully passed to mads")

test_that("Test Analyses", {
  
  # DATA SETUP
  data(ptdata.single)
  ptdata.single$distbegin <- (as.numeric(cut(ptdata.single$distance,10*(0:10)))-1)*10
  ptdata.single$distend <- (as.numeric(cut(ptdata.single$distance,10*(0:10))))*10
  ptdata.single$species <- rep("all", nrow(ptdata.single))
  # Exact distances
  ptdata.exact <- ptdata.single[,c("object", "observer", "detected", "distance", "species")]
  # Binned data
  ptdata.binned <- ptdata.single
  # dht tables
  region <- data.frame(Region.Label = 1, Area = 100000)
  samples <- data.frame(Sample.Label = 1:10, Region.Label = rep(1,10), Effort = rep(1,10))
  obs <- data.frame(object = 1:341, Region.Label = rep(1,341), Sample.Label = c(rep(1,30),rep(2,25), rep(3,45), rep(4,32), rep(5,25), rep(6,50), rep(7,50), rep(8,28), rep(9,30), rep(10,26)))
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Basic mads setup to just refit models with no resampling etc.
  # Therefore results should match plain mrds results
  
  model.names              <- list("all"=c("model1","model2"))
  ddf.model.options        <- list(criterion="AIC")
  bootstrap                <- FALSE
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Test point transect binned analyses can be replicated
  
  model1 <- ddf(data = ptdata.binned, dsmodel = ~cds(key = "hn"),
                meta.data = list(width = 100, point = TRUE, binned = TRUE, breaks = 10*(0:10)))
  expect_warning(model2 <- ddf(data = ptdata.binned, dsmodel = ~cds(key = "hr"),
                meta.data = list(width = 100, point = TRUE, binned = TRUE, breaks = 10*(0:10))))
  
  ddf.models <- list("model1" = model1, "model2" = model2)
  
  # Model1 has minimum AIC
  orig.AIC <- model1$criterion
  dht.results <- dht(model1, region, samples, obs)
  
  # Get mads to refit models and select model with minimum AIC
  expect_warning(
  results.to.compare <- execute.multi.analysis(species.code = names(model.names),
                                               models.by.species.code = model.names,
                                               ddf.model.objects = ddf.models,
                                               region.table = region,
                                               sample.table = samples,
                                               obs.table = obs,
                                               bootstrap = bootstrap,
                                               silent = TRUE))
  
  expect_equal(orig.AIC, results.to.compare$species$all$ddf$model1$AIC)
  expect_equal(as.numeric(dht.results$individuals$N$Estimate), results.to.compare$species$all$individuals$N$Estimate[1])
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Test uniform key function with adjustments with exact data
  
  expect_warning(model1 <- ddf(data=ptdata.exact, dsmodel=~cds(key="unif", adj.series="cos", adj.order=c(1,2)),
                meta.data=list(width = 100, point=TRUE),
                control = list(initial = list(scale = NULL, 
                                              shape = NULL, 
                                              adjustment = c(1.18514462448985, -0.0349107135619797)))))
  expect_warning(model2 <- ddf(data=ptdata.exact, dsmodel=~cds(key="unif", adj.series="cos", adj.order=c(2,4)),
                meta.data=list(width = 100, point=TRUE),
                control = list(initial = list(scale = NULL, 
                                              shape = NULL, 
                                              adjustment = c(-0.6164571, -0.1788562)))))
  
  ddf.models <- list("model1" = model1, "model2" = model2)
  
  # Model1 has minimum AIC
  orig.AIC <- model1$criterion
  dht.results <- dht(model1, region, samples, obs)
  
  # Get mads to refit models and select model with minimum AIC
  expect_warning(
    results.to.compare <- execute.multi.analysis(species.code = names(model.names),
                                                 models.by.species.code = model.names,
                                                 ddf.model.objects = ddf.models,
                                                 region.table = region,
                                                 sample.table = samples,
                                                 obs.table = obs,
                                                 bootstrap = bootstrap,
                                                 silent = TRUE))
  
  expect_equal(orig.AIC, results.to.compare$species$all$ddf$model1$AIC)
  expect_equal(as.numeric(dht.results$individuals$N$Estimate), results.to.compare$species$all$individuals$N$Estimate[1])

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Test left truncation
  
  model1 <- ddf(data = ptdata.exact, dsmodel = ~cds(key = "hn"),
                meta.data = list(width = 100, left = 10, point = TRUE))
  model2 <- ddf(data = ptdata.exact, dsmodel = ~cds(key = "hr"),
                meta.data = list(width = 100, left = 10, point = TRUE))
  
  ddf.models <- list("model1" = model1, "model2" = model2)
  
  # Model1 has minimum AIC
  orig.AIC <- model2$criterion
  dht.results <- dht(model2, region, samples, obs)
  
  # Get mads to refit models and select model with minimum AIC
  expect_warning(
    results.to.compare <- execute.multi.analysis(species.code = names(model.names),
                                                 models.by.species.code = model.names,
                                                 ddf.model.objects = ddf.models,
                                                 region.table = region,
                                                 sample.table = samples,
                                                 obs.table = obs,
                                                 bootstrap = bootstrap,
                                                 silent = TRUE))
  
  expect_equal(orig.AIC, results.to.compare$species$all$ddf$model2$AIC)
  expect_equal(as.numeric(dht.results$individuals$N$Estimate), results.to.compare$species$all$individuals$N$Estimate[1])
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Test adjustments with monotonicity restraints
  
  new.data <- ptdata.binned[ptdata.binned$distance > 10,]
  
  model1 <- ddf(data = new.data, dsmodel = ~cds(key = "hn", adj.series="cos", adj.order=c(2)),
                meta.data = list(width = 100, left = 10, point = TRUE, 
                                 binned = TRUE, breaks = 10*(1:10), mono = TRUE))
  
  expect_warning(model2 <- ddf(data = new.data, dsmodel = ~cds(key = "hr", adj.series="cos", adj.order=c(2)),
                meta.data = list(width = 100, left = 10, point = TRUE, 
                                 binned = TRUE, breaks = 10*(1:10), mono = TRUE)))
  
  ddf.models <- list("model1" = model1, "model2" = model2)
  
  # Model1 has minimum AIC
  orig.AIC <- model2$criterion
  dht.results <- dht(model2, region, samples, obs)
  
  # Get mads to refit models and select model with minimum AIC
  expect_warning(
    results.to.compare <- execute.multi.analysis(species.code = names(model.names),
                                                 models.by.species.code = model.names,
                                                 ddf.model.objects = ddf.models,
                                                 region.table = region,
                                                 sample.table = samples,
                                                 obs.table = obs,
                                                 bootstrap = bootstrap,
                                                 silent = TRUE))
  
  expect_equal(orig.AIC, results.to.compare$species$all$ddf$model2$AIC)
  expect_equal(round(as.numeric(dht.results$individuals$N$Estimate),2),
               round(results.to.compare$species$all$individuals$N$Estimate[1],2))
  
  
  
})








