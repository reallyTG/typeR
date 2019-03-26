library(gasfluxes)
context("fitting checks")

test_that("linear regression gives expected result", {
  t <- c(0, 1/3, 2/3, 1)
  C <- c(320, 341, 352, 359)
  fit <- lin.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 11.52, f0.se = 2.02849698052524, f0.p = 0.0296345042190038, 
                                   C0 = 323.8, AIC = 27.5179162394956, AICc = Inf, RSE = 5.03984126734168, 
                                   r = 0.970365495780996, diagnostics = ""), 
                              .Names = c("f0", "f0.se", "f0.p", "C0", "AIC", "AICc", "RSE", "r","diagnostics")), tolerance = 1e-5)
  
  C <- 320 + 0:3 * 10
  expect_warning(fit <- lin.fit(t, C, 1, 0.3, "a", verbose = FALSE), regexp = "essentially perfect fit", fixed = TRUE)
  expect_equal(fit$diagnostics, "essentially perfect fit: summary may be unreliable")
})

test_that("robust linear regression gives expected result", {
  skip_on_cran() #no idea why this test doesn't pass on winbuilder (Win Server 2008)
  
  t <- c(0, 1/3, 2/3, 1)
  C <- c(320, 341, 352, 359)
  fit <- rlin.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 11.52, f0.se = 2.02849698052524, f0.p = 0.0296345042190038, 
                                   C0 = 323.8, weights = c(1, 1, 1, 1), diagnostics = ""), 
                              .Names = c("f0", "f0.se", "f0.p", "C0", "weights", "diagnostics")), tolerance = 1e-5)
  C[2] <- 400
  fit <- rlin.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 10.3651999807438, f0.se = 7.74617801784988, 
                                   f0.p = 0.283145377159807, C0 = 328.932444530028, 
                                   weights = c(1, 0.224712479154538, 1, 1), diagnostics = ""), 
                              .Names = c("f0", "f0.se", "f0.p", "C0", "weights", "diagnostics")), tolerance = 1e-5)
  
  C <- 320 + 0:3 * 10
  fit <- rlin.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 9, f0.se = 5.05560019475045e-16, f0.p = 3.15544362088405e-33, 
                                   C0 = 320, weights = c(1, 1, 1, 1), diagnostics = ""), 
                              .Names = c("f0", "f0.se", "f0.p", "C0", "weights", "diagnostics")))
})

test_that("orig. HMR regression gives expected result", {
  t <- c(0, 1/3, 2/3, 1)
  C <- c(320, 341, 352, 359)
  fit <- HMR.orig(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 24.5726525375334, f0.se = 0.269619840794467, 
                                   f0.p = 0.000120370813714629, kappa = 1.7420647314171, phi = 367.070131017252, 
                                   AIC = 7.55291777918452, AICc = -32.4470822208155, RSE = 0.457638077871523, 
                                   diagnostics = ""), .Names = c("f0", "f0.se", "f0.p", "kappa", 
                                                                 "phi", "AIC", "AICc", "RSE", "diagnostics")))
  C[2] <- 400
  
  fit <- HMR.orig(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 0, f0.se = NA_real_, f0.p = NA_real_, kappa = NA_real_, 
                                phi = NA_real_, AIC = NA_real_, AICc = NA_real_, RSE = NA_real_, 
                                diagnostics = ""), .Names = c("f0", "f0.se", "f0.p", "kappa", 
                                                              "phi", "AIC", "AICc", "RSE", "diagnostics")))
  
  C <- 320 + 0:3 * 10
  fit <- HMR.orig(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = 9, f0.se = 0, f0.p = 0, kappa = NA_real_, 
                                phi = NA_real_, AIC = NA_real_, AICc = NA_real_, RSE = NA_real_, 
                                diagnostics = ""), .Names = c("f0", "f0.se", "f0.p", "kappa", 
                                                              "phi", "AIC", "AICc", "RSE", "diagnostics")))
})

test_that("HMR regression gives expected result", {
  skip_on_cran() #slightly different SE/p value on winbuilder
                 #doesn't return NA on winbuilder
  t <- c(0, 1/3, 2/3, 1)
  C <- c(320, 341, 352, 359)
  fit <- HMR.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  
  expect_equal(fit, structure(list(f0 = 24.5729190601842, f0.se = 1.09217335198933, 
                                   f0.p = 0.0282767319678857, kappa = 1.74209652356821, phi = 367.069739676469, 
                                   AIC = 7.55291751354392, AICc = -32.4470824864561, RSE = 0.457638062675616, 
                                   diagnostics = ""), .Names = c("f0", "f0.se", "f0.p", "kappa", 
                                                                 "phi", "AIC", "AICc", "RSE", "diagnostics")))
  expect_equal(fit["f0"], HMR.orig(t, C, 1, 0.3, "a", verbose = FALSE)["f0"], tolerance = 1e-4)
 
  C[2] <- 400
  fit <- HMR.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = NA_real_, f0.se = NA_real_, f0.p = NA_real_, 
                                   kappa = NA_real_, phi = NA_real_, AIC = NA_real_, AICc = NA_real_, 
                                   RSE = NA_real_, diagnostics = "Missing value or an infinity produced when evaluating the model"), 
                              .Names = c("f0", "f0.se", "f0.p", "kappa", "phi", "AIC", "AICc", "RSE", "diagnostics"
                                   )))
  
  C <- 320 + 0:3 * 10
  fit <- HMR.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = NA_real_, f0.se = NA_real_, f0.p = NA_real_, 
                                   kappa = NA_real_, phi = NA_real_, AIC = NA_real_, AICc = NA_real_, 
                                   RSE = NA_real_, diagnostics = "element (3, 3) is zero, so the inverse cannot be computed"), 
                              .Names = c("f0", "f0.se", "f0.p", "kappa", "phi", "AIC", "AICc", "RSE", "diagnostics"
                                   )))
})

test_that("NDFE regression gives expected result", {
  skip_on_cran() #slightly different flux/SE/p/tau value on winbuilder
  t <- c(0, 1/3, 2/3, 1)
  C <- c(320, 341, 352, 359)
  fit <- NDFE.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  
  expect_equal(fit, structure(list(f0 = 108.747818996036, f0.se = 62.9208765449726, 
                                   f0.p = 0.333927030887926, tau = 0.0111016600093449, C0 = 319.992148880558, 
                                   AIC = 10.7342239838649, AICc = -29.2657760161351, RSE = 0.681122330960559, 
                                   diagnostics = ""), .Names = c("f0", "f0.se", "f0.p", "tau", 
                                                                 "C0", "AIC", "AICc", "RSE", "diagnostics")), tolerance = 1e-5)
  
  C[2] <- 400
  fit <- NDFE.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = NA_real_, f0.se = NA_real_, f0.p = NA_real_, 
                                   tau = NA_real_, C0 = NA_real_, AIC = NA_real_, AICc = NA_real_, 
                                   RSE = NA_real_, diagnostics = "Missing value or an infinity produced when evaluating the model"), 
                              .Names = c("f0", "f0.se", "f0.p", "tau", "C0", "AIC", "AICc", "RSE", "diagnostics"
                                   )))
  
  C <- 320 + 0:3 * 10
  fit <- NDFE.fit(t, C, 1, 0.3, "a", verbose = FALSE)
  expect_equal(fit, structure(list(f0 = NA_real_, f0.se = NA_real_, f0.p = NA_real_, 
                                   tau = NA_real_, C0 = NA_real_, AIC = NA_real_, AICc = NA_real_, 
                                   RSE = NA_real_, diagnostics = "step factor 5.82077e-11 reduced below 'minFactor' of 1e-10"), 
                              .Names = c("f0", "f0.se", "f0.p", "tau", "C0", "AIC", "AICc", "RSE", "diagnostics"
                                   )))
})