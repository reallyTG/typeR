library(mrds)
library(testthat)

context("Testing mark-recapture in mads")

test_that("Test Analyses", {
  
  # DATA SETUP
  data(book.tee.data)
  region <- book.tee.data$book.tee.region
  samples <- book.tee.data$book.tee.samples
  obs <- book.tee.data$book.tee.obs
  egdata <- book.tee.data$book.tee.dataframe
  
  # Add species code
  egdata$species <- rep("all", nrow(egdata))
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Basic mads setup to just refit models with no resampling etc.
  # Therefore results should match plain mrds results
  
  model.names              <- list("all"=c("model1","model2"))
  ddf.model.options        <- list(criterion="AIC")
  bootstrap                <- FALSE
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Test double observer analyses can be replicated
  
  # fit an independent observer model with full independence
  model1 <- ddf(mrmodel=~glm(~distance), data=egdata, method="io.fi",
                      meta.data=list(width = 4))
  # fit an independent observer model with point independence
  model2 <- ddf(dsmodel=~cds(key = "hn"), mrmodel=~glm(~distance),
                data=egdata, method="io", meta.data=list(width=4))

  ddf.models <- list("model1" = model1, "model2" = model2)
  
  # Model1 has minimum AIC
  orig.AIC <- model2$criterion
  dht.results <- dht(model2, region, samples, obs)
  
  # Get mads to refit models and select model with minimum AIC
  
})








