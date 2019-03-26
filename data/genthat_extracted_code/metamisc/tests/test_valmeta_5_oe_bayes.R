context("valmeta 5. bayesian meta-analysis of total O:E ratio")
skip_on_cran()

library(lme4)
library(rjags)
library(runjags)
data(EuroSCORE)

test_that("Bayesian random effect meta-analysis of total O:E ratio works", {
  
  pars <- list(hp.tau.dist="dhalft",   # Prior for the between-study standard deviation
               hp.tau.sigma=1.5,       # Standard deviation for 'hp.tau.dist'
               hp.tau.df=3,            # Degrees of freedom for 'hp.tau.dist'
               hp.tau.max=10)          # Maximum value for the between-study standard deviation
  
  fit1 <- valmeta(measure="OE", O=EuroSCORE$n.events, 
                  E=EuroSCORE$e.events, N=EuroSCORE$n, method="BAYES", slab=EuroSCORE$Study, pars=pars)
  
  expect_equal(fit1$numstudies, nrow(EuroSCORE))
  
  # Set some studies sample size to NA
  N <- EuroSCORE$n
  N[1:10] <- NA
  fit2 <- valmeta(measure = "OE", 
                  O = EuroSCORE$n.events, 
                  E = EuroSCORE$e.events, 
                  N = N, 
                  method = "BAYES", slab = EuroSCORE$Study, pars = pars, ret.fit = TRUE)
  
  expect_equal(fit2$numstudies, nrow(EuroSCORE))
  expect_equal(as.character(class(fit2$fit)), "runjags")
  
})