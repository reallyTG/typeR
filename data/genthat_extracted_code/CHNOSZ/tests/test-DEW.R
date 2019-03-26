context("DEW")

# since this is alphabetically the first test,
# we need to load the 'thermo' object (for running tests in R CMD check)
suppressMessages(reset())

test_that("density of water is calculated correctly", {
  pressure <- c(5000, 5000, 10000, 10000, 20000, 20000, 50000, 50000)
  temperature <- c(100, 1000, 100, 1000, 100, 1000, 100, 1000)
  # density from R translation of DEW macro functions
  RDensity <- calculateDensity(pressure, temperature)
  # density from DEW spreadsheet
  DEWDensity <- c(1.108200, 0.597623, 1.196591, 0.798331, 1.321050, 1.000735, 1.578116, 1.287663)
  expect_equal(RDensity, DEWDensity, tolerance=1e-6)
})

test_that("Gibbs energy of water is calculated correctly", {
  pressure <- c(5000, 5000, 10000, 10000, 20000, 20000, 50000, 50000)
  temperature <- c(100, 1000, 100, 1000, 100, 1000, 100, 1000)
  # Gibbs energies from R translation of DEW macro functions
  RGibbs <- calculateGibbsOfWater(pressure, temperature)
  # Gibbs energies from DEW spreadsheet
  DEWGibbs <- c(-56019.85419280258, -84262.028821198, -54155.004480575895, -81210.38766217149,
                -50735.122222685815, -76433.07602205424, -41823.26077175943, -65187.48113532527)
  expect_equal(RGibbs, DEWGibbs)
})

test_that("dielectric constant of water is calculated correctly", {
  pressure <- c(5000, 5000, 10000, 10000, 20000, 20000, 50000, 50000)
  temperature <- c(100, 1000, 100, 1000, 100, 1000, 100, 1000)
  # epsilon from R translation of DEW macro functions
  Repsilon <- calculateEpsilon(calculateDensity(pressure, temperature), temperature)
  # epsilon from DEW spreadsheet
  DEWepsilon <- c(65.63571, 6.10465, 72.40050, 8.97800, 82.16244, 12.13131, 103.12897, 16.97266)
  expect_equal(Repsilon, DEWepsilon, tolerance=1e-7)
})

test_that("Born coefficient Q is calculated correctly", {
  pressure <- c(5000, 5000, 10000, 10000, 20000, 20000, 50000, 50000)
  temperature <- c(100, 1000, 100, 1000, 100, 1000, 100, 1000)
  # Q from R translation of DEW macro functions
  RQ <- calculateQ(calculateDensity(pressure, temperature), temperature)
  # Q from DEW spreadsheet
  DEWQ <- c(0.32319817, 14.50286092, 0.19453478, 3.12650897,
            0.10918151, 0.87729257,  0.05068788, 0.20640645) / 1e6
  expect_equal(RQ, DEWQ)
})

test_that("g function is calculated correctly", {
  pressure <- c(1000, 1000, 5000, 5000, 10000)
  temperature <- c(100, 1000, 100, 1000, 100)
  # properties of water from DEW implementation in CHNOSZ
  oldwat <- water("DEW")
  # note that values returned for alpha, daldT, beta are NA
  w <- water(c("rho", "alpha", "daldT", "beta", "Psat"), T=convert(temperature, "K"), P=pressure)
  # g from CHNOSZ functions
  Rg <- gfun(w$rho/1000, temperature, pressure, w$alpha, w$daldT, w$beta)$g
  # g from R translation of DEW macro functions (not used in CHNOSZ)
  DEWg <- calculateG(pressure, temperature, w$rho/1000)
  expect_equal(Rg, DEWg)
  water(oldwat)
})

test_that("Gibbs energies of species are calculated correctly", {
  P <- c(5000, 5000, 10000, 10000, 20000, 20000, 50000, 50000)
  T <- c(100, 1000, 100, 1000, 100, 1000, 100, 1000)
  oldwat <- water("DEW")
  add.obigt("DEW_aq")
  RG_HCl <- subcrt("HCl", P=P, T=T)$out[[1]]$G
  DEWG_HCl <- c(-28784.99, -58496.85, -26520.94, -55276.92, -21928.89, -50337.19, -8014.34, -36746.87)
  expect_equal(RG_HCl, DEWG_HCl, tolerance = 1e-7)
  RG_Cl <- subcrt("Cl-", P=P, T=T)$out[[1]]$G
  DEWG_Cl <- c(-30054.59, -22839.35, -27910.68, -28094.07, -23568.45, -27959.67, -10443.07, -18744.93)
  expect_equal(RG_Cl, DEWG_Cl, tolerance = 1e-7)
  water(oldwat)
})

test_that("Delta G, logK, and Delta V of reactions are calculated correctly", {
  # These are reactions corresponding to Fig. 1b of Sverjensky et al., 2014 (Nat. Geosci.).
  # The properties are calculated using parameters from the DEW spreadsheet,
  # which are not necessarily identical those that were used for the paper.
  oldwat <- water("DEW")
  add.obigt("DEW_aq", c("CO2", "HCO3-", "CO3-2", "acetic acid", "acetate", "methane"))
  T <- 600
  P <- c(5000, 50000)
  R1 <- subcrt(c("H2O", "CO2", "HCO3-", "H+"), c(-1, -1, 1, 1), T=T, P=P)$out
  R2 <- subcrt(c("HCO3-", "CO3-2", "H+"), c(-1, 1, 1), T=T, P=P)$out
  R3 <- subcrt(c("acetic acid", "acetate", "H+"), c(-1, 1, 1), T=T, P=P)$out
  R4 <- subcrt(c("H2O", "CO2", "acetic acid", "oxygen"), c(-2, -2, 1, 2), T=T, P=P)$out
  R5 <- subcrt(c("oxygen", "CH4", "acetic acid", "H2O"), c(-2, -2, 1, 2), T=T, P=P)$out

  # Delta G values calculated using the DEW spreadsheet (May 2017 version)
  DEW_DG <- c(38267.404507442814, 14893.170655988564,   # R1
              41407.05995898576,  21347.599525026497,   # R2
              28109.598104640143, 16112.928184675075,   # R3
              186960.22705581048, 133640.9631638353,    # R4
              -141552.60059404257, -134279.54670605875) # R5
  # the aqueous-only reactions
  expect_equal(c(R1$G, R2$G, R3$G), DEW_DG[1:6], tolerance=1e-7)
  # note that there is a small error for oxygen in the DEW spreadsheet (wrong c parameter),
  # but even so, these tests have a lower tolerance because of the larger magnitude of the difference
  expect_equal(c(R4$G, R5$G), DEW_DG[7:10], tolerance=1e-9)

  # logK values calculated using the DEW spreadsheet
  DEW_logK <- c(-9.58455651110442, -3.7301833667366027,
                -10.370923015131565, -5.346776889042665,
                -7.040405143911882, -4.035687100632826, 
                -46.826558649850625, -33.47207316851283,
                35.45364304557209, 33.632014510923746) 
  expect_equal(c(R1$logK, R2$logK, R3$logK, R4$logK, R5$logK), DEW_logK, tolerance=1e-3)

  # Delta V values calculated using the DEW spreadsheet
  DEW_DV <- c(-45.26925983499276, -14.640599169742725,
              -47.95180846799733, -9.469432706749927, 
              -27.042087540311922, -6.836267057722694,
              -18.1550937649195, 5.513800665649967,
              -37.37077435045512, -45.08570662275889)
  # for the aqueous species we're getting very close results
  # (at P=5000 bar this depends on calculating drhodP -> beta -> dgdP -> dwdP -> V correctly, which is not tested above)
  expect_equal(c(R1$V, R2$V, R3$V), DEW_DV[1:6], tolerance=1e-15)
  # TODO: why does DEW spreadsheet use V (O2,g) == 24.465?
  #expect_equal(c(R4$V, R5$V), DEW_DV[7:10])

  # reset computational option for water
  water(oldwat)
})
