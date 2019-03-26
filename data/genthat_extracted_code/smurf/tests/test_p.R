context("Test p function for formula")


test_that("Test penalty name in p function", {
  
  formu <- rentm ~ p(area, pen = "gglasso")
  expect_error(glmsmurf(formu, family = gaussian(), data = rent),
               "Invalid penalty name.")
})


test_that("Test factor errors in p function", {
  
  # Expect error since good is not a factor
  expect_error(glmsmurf(rentm ~ p(good, pen = "flasso"), 
                        family = gaussian(), data = rent),
               "Predictor 'good' needs to be given as a factor.")
  
  expect_error(glmsmurf(rentm ~ p(good, pen = "gflasso"), 
                        family = gaussian(), data = rent),
               "Predictor 'good' needs to be given as a factor.")
  
  expect_error(glmsmurf(rentm ~ p(good, pen = "ggflasso"), 
                        family = gaussian(), data = rent),
               "Predictor 'good' needs to be given as a factor.")
  
  # Expect error since warm2 is not a factor or numeric
  rent$warm2 <- as.character(rent$warm)
  expect_error(glmsmurf(rentm ~ p(warm2, pen = "none"), 
                        family = gaussian(), data = rent),
               "Predictor 'warm2' needs to be given as a factor or numeric.")
  
  expect_error(glmsmurf(rentm ~ p(warm2, pen = "lasso"), 
                        family = gaussian(), data = rent),
               "Predictor 'warm2' needs to be given as a factor or numeric.")
  
  expect_error(glmsmurf(rentm ~ p(warm2, pen = "grouplasso"), 
                        family = gaussian(), data = rent),
               "Predictor 'warm2' needs to be given as a factor or numeric.")
  
  # Test if warning for ordered
  rent$area2 <- ordered(rent$area)
  terms <- terms(rentm ~ p(area2, pen = "flasso"), specials = "p", data = rent)
  expect_warning(model.frame(formula = terms, data = rent, drop.unused.levels = TRUE),
                 "Predictor 'area2' is transformed from an ordered factor to a factor.")
})


test_that("Test 2D Fused Lasso in p function", {
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "2dflasso"), 
                        family = gaussian(), data = rent),
               "No second predictor is given for penalty type '2dflasso'.")
  
  expect_error(glmsmurf(rentm ~ p(area, year, pen = "flasso"), 
                        family = gaussian(), data = rent),
               "Two predictors are given, penalty type should be '2dflasso'.")
  
  rent$warm2 <- as.character(rent$warm)
  expect_error(glmsmurf(rentm ~ p(good, warm2, pen = "2dflasso"), 
                        family = gaussian(), data = rent),
               paste0("Predictors 'good' and 'warm2' in the interaction need to be given as factors."))
  
  expect_error(glmsmurf(rentm ~ p(area, warm2, pen = "2dflasso"), 
                        family = gaussian(), data = rent),
               paste0("Predictors 'area' and 'warm2' in the interaction need to be given as factors."))
  
  expect_error(glmsmurf(rentm ~ p(warm2, area, pen = "2dflasso"), 
                        family = gaussian(), data = rent),
               paste0("Predictors 'warm2' and 'area' in the interaction need to be given as factors."))
})


test_that("Test 'group' in p function", {
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = -1), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = 0), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = 0.5), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = 1:2), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer of length 1 or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = NA), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer of length 1 or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = NaN), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer or NULL.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "grouplasso", group = Inf), 
                        family = gaussian(), data = rent),
               "'group' needs to be a strictly positive integer or NULL.",
               fixed = TRUE)
})


test_that("Test 'refcat' in p function", {
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "flasso", refcat = 1:2), 
                        family = gaussian(), data = rent),
               "The 'refcat' argument for the predictor 'area' should be NULL or have length 1.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "flasso", refcat = NA), 
                        family = gaussian(), data = rent),
               "'NA' is not a level of the predictor 'area'.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "flasso", refcat = NaN), 
                        family = gaussian(), data = rent),
               "'NaN' is not a level of the predictor 'area'.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "flasso", refcat = Inf), 
                        family = gaussian(), data = rent),
               "'Inf' is not a level of the predictor 'area'.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(area, pen = "flasso", refcat = 0), 
                        family = gaussian(), data = rent),
               "'0' is not a level of the predictor 'area'.",
               fixed = TRUE)
  
  terms <- terms(rentm ~ p(year, area, pen = "2dflasso", refcat = "1"), specials = "p", data = rent)
  expect_warning(model.frame(formula = terms, data = rent, drop.unused.levels = TRUE),
                 "The 'refcat' argument is ignored for 'pen = \"2dflasso\"'.")
  
  expect_error(glmsmurf(rentm ~ p(quality, pen = "flasso", refcat="good") + p(bathextra, pen = "flasso") +
                          p(quality, bathextra, pen = "2dflasso"), family = gaussian(), data = rent), 
               "The reference category for the predictor 'quality 'cannot be changed as it (or its binned version) is included in a 2D effect.",
               fixed = TRUE)
  
  expect_error(glmsmurf(rentm ~ p(quality, pen = "flasso") + p(bathextra, pen = "flasso", refcat="yes") +
                          p(quality, bathextra, pen = "2dflasso"), family = gaussian(), data = rent), 
               "The reference category for the predictor 'bathextra 'cannot be changed as it (or its binned version) is included in a 2D effect.",
               fixed = TRUE)
})
