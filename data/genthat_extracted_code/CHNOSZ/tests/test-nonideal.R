context("nonideal")

# 20161219
test_that("loggam and logK values are consistent", {
  oldnon <- nonideal("Alberty")
  rxn1 <- subcrt(c("anhydrite", "Ca+2", "SO4-2"), c(-1, 1, 1), P=1, T=25, I=0)
  rxn2 <- subcrt(c("anhydrite", "Ca+2", "SO4-2"), c(-1, 1, 1), P=1, T=25, I=0.7)
  expect_equal(rxn1$out$logK, rxn2$out$loggam + rxn2$out$logK)
  nonideal(oldnon)
})

# 20171011
test_that("A and B parameters are calculated correctly", {
  ## Psat
  # values from Helgeson, 1967 "Solution chemistry and metamorphism"
  # (chapter in http://www.worldcat.org/oclc/152725534)
  T <- c(25, 50, 100, 200, 300, 350)
  A <- c(0.5095, 0.5354, 0.6019, 0.8127, 1.2979, 1.9936)
  B <- c(0.3284, 0.3329, 0.3425, 0.3659, 0.4010, 0.4300)
  SUP <- water.SUPCRT92(c("A_DH", "B_DH"), T=convert(T, "K"), P="Psat")
  IAP <- water.IAPWS95(c("A_DH", "B_DH"), T=convert(T, "K"), P="Psat")
  expect_maxdiff(SUP$A_DH, A, 0.18)
  expect_maxdiff(IAP$A_DH, A, 0.11)
  expect_maxdiff(SUP$B_DH / 1e8, B, 0.012)
  expect_maxdiff(IAP$B_DH / 1e8, B, 0.008)

  # values digitized from Fig. 10 of Manning et al., 2013
  # doi: 10.2138/rmg.2013.75.5
  ## 5 kbar
  T5 <- c(25, seq(100, 1000, 100))
  A5 <- c(0.441, 0.49, 0.583, 0.685, 0.817, 0.983, 1.164, 1.409, 1.673, 1.938, 2.187)
  B5 <- c(0.328, 0.336, 0.350, 0.363, 0.377, 0.391, 0.405, 0.421, 0.434, 0.445, 0.453)
  SUP5 <- water.SUPCRT92(c("A_DH", "B_DH"), T=convert(T5, "K"), P=rep(5000, 11))
  IAP5 <- water.IAPWS95(c("A_DH", "B_DH"), T=convert(T5, "K"), P=rep(5000, 11))
  DEW5 <- water.DEW(c("A_DH", "B_DH"), T=convert(T5, "K"), P=rep(5000, 11))
  # DEW is the winner here
  expect_maxdiff(SUP5$A_DH, A5, 0.47)
  expect_maxdiff(IAP5$A_DH, A5, 0.26)
  expect_maxdiff(DEW5$A_DH, A5, 0.14)
  expect_maxdiff(SUP5$B_DH / 1e8, B5, 0.036)
  expect_maxdiff(IAP5$B_DH / 1e8, B5, 0.021)
  expect_maxdiff(DEW5$B_DH / 1e8, B5, 0.013)

  ## 30 kbar
  T30 <- seq(700, 1000, 100)
  A30 <- c(0.625, 0.703, 0.766, 0.815)
  B30 <- c(0.386, 0.400, 0.409, 0.416)
  DEW30 <- water.DEW(c("A_DH", "B_DH"), T=convert(T30, "K"), P=rep(30000, 4))
  expect_maxdiff(DEW30$A_DH, A30, 0.06)
  expect_maxdiff(DEW30$B_DH / 1e8, B30, 0.024)
})

test_that("affinity transect incorporates IS correctly", {
  basis("CHNOS+")
  species("acetate")
  # calculations at single combinations of logfO2 and IS
  basis("O2", -80); a80_0 <- affinity()
  basis("O2", -60); a60_1 <- affinity(IS=1)
  # calculations on a transect with those endpoints
  a <- affinity(O2=seq(-80, -60, length.out=4), IS=seq(0, 1, length.out=4))
  expect_equal(a$values[[1]][1], a80_0$values[[1]][1])
  expect_equal(a$values[[1]][4], a60_1$values[[1]][1])
  # 20171013: that was working fine, but how about a more complicated case involving T?
  a25_0 <- affinity()
  a50_1 <- affinity(T=50, IS=1)
  a <- affinity(T=seq(25, 50, length.out=4), IS=seq(0, 1, length.out=4))
  expect_equal(a$values[[1]][1], a25_0$values[[1]][1])
  expect_equal(a$values[[1]][4], a50_1$values[[1]][1])
})

# 20171221
test_that("nonideality calculations work for Zn", {
  # nonideal() had a bug where both Z and Zn were identified as the charge
  # in the species formula, producing an error in this calculation
  expect_type(subcrt(c("Zn+2", "Cl-", "ZnCl+"), c(-1, -1, 1), T=200, P=16, IS=0.05), "list")   
})


# 20181105
test_that("activity coefficients are similar to those from HCh", {
  # ionic strength of solution and activity coefficients of Na+ and Cl-
  # calculated with HCh version 3.7 (Shvarov and Bastrakov, 1999) at 1000 bar,
  # 100, 200, and 300 degress C, and 1 to 6 molal NaCl,
  # using the default "B-dot" activity coefficient model (Helgeson, 1969)
  # and the default setting for the Setchenow equation,
  # for which the only non-zero term is the mole fraction to molality conversion factor
  IS.HCh <- list(`100`=c(0.992, 1.969, 2.926, 3.858, 4.758, 5.619),
                 `300`=c(0.807, 1.499, 2.136, 2.739, 3.317, 3.875),
                 `500`=c(0.311, 0.590, 0.861, 1.125, 1.385, 1.642))
  gamCl.HCh <- list(`100`=c(0.565, 0.545, 0.551, 0.567, 0.589, 0.615),
                    `300`=c(0.366, 0.307, 0.275, 0.254, 0.238, 0.224),
                    `500`=c(0.19, 0.137, 0.111, 0.096, 0.085, 0.077))
  gamNa.HCh <- list(`100`=c(0.620, 0.616, 0.635, 0.662, 0.695, 0.730),
                    `300`=c(0.421, 0.368, 0.339, 0.318, 0.302, 0.288),
                    `500`=c(0.233, 0.180, 0.155, 0.138, 0.126, 0.117))
  gamNaCl.HCh <- list(`100`=c(0.965, 0.933, 0.904, 0.876, 0.850, 0.827),
                      `300`=c(0.968, 0.941, 0.915, 0.892, 0.870, 0.849),
                      `500`=c(0.977, 0.955, 0.935, 0.915, 0.897, 0.879))
  # calculate activity coefficent of Cl- at each temperature
  gamCl.100 <- 10^subcrt("Cl-", T=100, P=1000, IS=IS.HCh$`100`)$out$`Cl-`$loggam
  gamCl.300 <- 10^subcrt("Cl-", T=300, P=1000, IS=IS.HCh$`300`)$out$`Cl-`$loggam
  gamCl.500 <- 10^subcrt("Cl-", T=500, P=1000, IS=IS.HCh$`500`)$out$`Cl-`$loggam
  expect_maxdiff(gamCl.100, gamCl.HCh$`100`, 0.07)
  expect_maxdiff(gamCl.300, gamCl.HCh$`300`, 0.03)
  expect_maxdiff(gamCl.500, gamCl.HCh$`500`, 0.009)
  # calculate activity coefficent of Na+ at each temperature
  gamNa.100 <- 10^subcrt("Na+", T=100, P=1000, IS=IS.HCh$`100`)$out$`Na+`$loggam
  gamNa.300 <- 10^subcrt("Na+", T=300, P=1000, IS=IS.HCh$`300`)$out$`Na+`$loggam
  gamNa.500 <- 10^subcrt("Na+", T=500, P=1000, IS=IS.HCh$`500`)$out$`Na+`$loggam
  expect_maxdiff(gamNa.100, gamNa.HCh$`100`, 0.08)
  expect_maxdiff(gamNa.300, gamNa.HCh$`300`, 0.03)
  expect_maxdiff(gamNa.500, gamNa.HCh$`500`, 0.013)
  # calculate activity coefficent of NaCl at each temperature
  gamNaCl.100 <- 10^subcrt("NaCl", T=100, P=1000, IS=IS.HCh$`100`)$out$`NaCl`$loggam
  gamNaCl.300 <- 10^subcrt("NaCl", T=300, P=1000, IS=IS.HCh$`300`)$out$`NaCl`$loggam
  gamNaCl.500 <- 10^subcrt("NaCl", T=500, P=1000, IS=IS.HCh$`500`)$out$`NaCl`$loggam
  expect_maxdiff(gamNaCl.100, gamNaCl.HCh$`100`, 0.09)
  expect_maxdiff(gamNaCl.300, gamNaCl.HCh$`300`, 0.09)
  expect_maxdiff(gamNaCl.500, gamNaCl.HCh$`500`, 0.10)
})
