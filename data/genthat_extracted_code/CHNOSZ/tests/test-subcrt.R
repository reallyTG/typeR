context("subcrt")

# delete the basis definition in case there is one
basis(delete=TRUE)

test_that("unbalanced reactions give a warning or are balanced given sufficient basis species", {
  expect_warning(subcrt(c("glucose", "ethanol"), c(-1, 3)), "reaction was unbalanced, missing H-6O3")
  basis("CHNOS")
  s <- subcrt(c("malic acid", "citric acid"), c(-1, 1))
  expect_equal(s$reaction$coeff, c(-1, 1, -2, -1, 1.5))
  expect_equal(s$reaction$name, c("malic acid", "citric acid", "CO2", "water", "oxygen"))
})

test_that("standard Gibbs energies of reactions involving aqueous species are consistent with the literature", {
  # from Amend and Shock, 2001 [AS01] Table 3
  T <- c(2, 18, 25, 37, 45, 55, 70, 85, 100, 115, 150, 200)
  # standard Gibbs energies in kJ/mol
  E.units("J")

  # H2O(l) = H+ + OH-
  AS01.H2O <- c(78.25, 79.34, 79.89, 80.90, 81.63, 82.59, 84.13, 85.78, 87.55, 89.42, 94.22, 102.21)
  sout.H2O <- subcrt(c("H2O", "H+", "OH-"), c(-1, 1, 1), T=T)$out
  # tolerances set to lowest order of magnitute to pass
  expect_maxdiff(sout.H2O$G/1000, AS01.H2O, 0.01)

  # AS01 Table 4.3 Reaction A1: H2(aq) + 0.5O2(aq) = H2O(l)
  AS01.A1 <- c(-263.94, -263.45, -263.17, -262.62, -262.20, -261.63, -260.67, -259.60, -258.44, -257.18, -253.90, -248.44)
  sout.A1 <- subcrt(c("H2", "O2", "H2O"), "aq", c(-1, -0.5, 1), T=T)$out
  expect_maxdiff(sout.A1$G/1000, AS01.A1, 0.01)

  # AS01 Table 6.3 Reaction C7: 5S2O3-2 + H2O(l) + 4O2(aq) = 6SO4-2 + 2H+ + 4S(s)
  AS01.C7 <- c(-1695.30, -1686.90, -1682.80, -1675.30, -1670.00, -1663.10, -1652.00, -1640.30, -1628.00, -1615.20, -1583.50, -1533.00)
  s.C7 <- subcrt(c("S2O3-2", "H2O", "O2", "SO4-2", "H+", "S"), c("aq", "liq", "aq", "aq", "aq", "cr"), c(-5, -1, -4, 6, 2, 4), T=T)
  sout.C7 <- s.C7$out
  expect_maxdiff(sout.C7$G/1000, AS01.C7, 0.05)
  # we can also check that sulfur has expected phase transitions
  expect_equal(s.C7$polymorphs$sulfur, c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3))

  # return to our favorite units
  E.units("cal")
})

test_that("subzero degree C calculations are possible", {
  ## start with H2O
  s.H2O <- subcrt("H2O", T=c(-20.1, seq(-20, 0)), P=1)$out$water
  # we shouldn't get anything at -20.1 deg C
  expect_equal(s.H2O$G[1], NA_real_)
  # we should get something at -20 deg C
  expect_equal(floor(s.H2O$G[2]), -56001)
  # following SUPCRT92, an input temperature of 0 is converted to 0.01
  expect_equal(s.H2O$T[22], 0.01)
})

test_that("calculations using IAPWS-95 are possible", {
  oldwat <- water("IAPWS95")
  sb <- subcrt(c("H2O", "Na+"), T=c(-30, -20, 0, 10), P=1)$out
  # the test is not a demanding numerical comparison, more that we got numbers and no error
  expect_true(all(sb$`Na+`$G < sb$water$G))
  # clean up
  water(oldwat)
})

test_that("phase transitions of minerals give expected messages and results", {
  iacanthite <- info("acanthite", "cr2")
  expect_message(subcrt(iacanthite), "subcrt: temperature\\(s\\) of 623.15 K and above exceed limit for acanthite cr2 \\(using NA for G\\)")
  expect_equal(subcrt("acanthite")$out$acanthite$polymorph, c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3))
  # the reaction coefficients in the output should be unchanged 20171214
  expect_equal(subcrt(c("bunsenite", "nickel", "oxygen"), c(-1, 1, 0.5))$reaction$coeff, c(-1, 1, 0.5)) 
})

test_that("calculations for K-feldspar are consistent with SUPCRT92", {
  # use the superseded Helgeson et al., 1978 data
  add.obigt("SUPCRT92", "K-feldspar")
  T <- c(100, 100, 1000, 1000)
  P <- c(5000, 50000, 5000, 50000)
  SUPCRT_G <- c(-886628, -769531, -988590, -871493)
  SUPCRT_H <- c(-932344, -815247, -865868, -748771)
  SUPCRT_S <- c(62.6, 62.6, 150.6, 150.6)
  SUPCRT_V <- c(108.9, 108.9, 108.9, 108.9)
  SUPCRT_Cp <- c(56.7, 56.7, 80.3, 80.3)
  CHNOSZ <- subcrt("K-feldspar", T=T, P=P)$out[[1]]
  expect_equal(round(CHNOSZ$G), SUPCRT_G)
  expect_equal(round(CHNOSZ$H), SUPCRT_H)
  expect_equal(round(CHNOSZ$S, 1), SUPCRT_S)
  expect_equal(round(CHNOSZ$V, 1), SUPCRT_V)
  expect_equal(round(CHNOSZ$Cp, 1), SUPCRT_Cp)
  obigt()
})

test_that("calculations for quartz are nearly consistent with SUPCRT92", {
  add.obigt("SUPCRT92")
  # using SUPCRT's equations, the alpha-beta transition occurs at
  # 705 degC at 5000 bar and 1874 degC at 50000 bar,
  # so here beta-quartz is stable only at T=1000, P=5000
  T <- c(100, 100, 1000, 1000)
  P <- c(5000, 50000, 5000, 50000)
  SUPCRT_G <- c(-202778, -179719, -223906, -199129)
  SUPCRT_H <- c(-214133, -191708, -199359, -177118)
  SUPCRT_S <- c(12.3, 10.6, 31.8, 29.8)
  SUPCRT_V <- c(22.5, 20.3, 23.7, 21.9)
  SUPCRT_Cp <- c(12.3, 12.3, 16.9, 16.9)
  CHNOSZ <- subcrt("quartz", T=T, P=P)$out[[1]]
  # NOTE: Testing has shown that, where alpha-quartz is stable above Ttr(Pr) but below Ttr(P),
  # SUPCRT92 computes the heat capacity and its integrals using parameters of beta-quartz.
  # (see e.g. the equation for CprdT under the (Cpreg .EQ. 2) case in the Cptrms subroutine of SUPCRT).
  # ... is that incorrect?
  # CHNOSZ's behavior is different - it only uses the lower-T polymorph below Ttr(P);
  # so we get different values from SUPCRT at T=1000, P=50000 (4th condition) where alpha-quartz is stable
  # (above Ttr@1 bar (575 degC), but below Ttr@50000 bar)
  expect_equal(round(CHNOSZ$G)[-4], SUPCRT_G[-4])
  expect_equal(round(CHNOSZ$H)[-4], SUPCRT_H[-4])
  expect_equal(round(CHNOSZ$S, 1)[-4], SUPCRT_S[-4])
  expect_equal(round(CHNOSZ$Cp, 1)[-4], SUPCRT_Cp[-4])
  expect_equal(round(CHNOSZ$V, 1), SUPCRT_V)
  obigt()
})

test_that("more calculations for quartz are nearly consistent with SUPCRT92", {
  add.obigt("SUPCRT92")
  # output from SUPCRT92 for reaction specified as "1 QUARTZ" run at 1 bar
  # (SUPCRT shows phase transition at 574.850 deg C, and does not give Cp values around the transition)
  S92_1bar <- read.table(header = TRUE, text = "
      T       G       H    S       V
    573	-214507	-209517	24.7	23.3
    574	-214532	-209499	24.8	23.3
    575	-214557	-209192	25.1	23.7
    576	-214582	-209176	25.1	23.7
  ")
  CHNOSZ_1bar <- subcrt("quartz", T=seq(573, 576), P=1)$out[[1]]
  expect_equal(round(CHNOSZ_1bar$G), S92_1bar$G)
  expect_equal(round(CHNOSZ_1bar$H), S92_1bar$H)
  expect_equal(round(CHNOSZ_1bar$S, 1), S92_1bar$S)
  expect_equal(round(CHNOSZ_1bar$V, 1), S92_1bar$V)

  # 5000 bar: SUPCRT shows phase transition at 704.694 deg C
  S92_5000bar <- read.table(header = TRUE, text = "
      T       G       H    S       V
    703	-215044	-204913	26.7	23.3
    704	-215071	-204895	26.7	23.3
    705	-215142	-204254	27.4	23.7
    706	-215170	-204238	27.5	23.7
  ")
  CHNOSZ_5000bar <- subcrt("quartz", T=seq(703, 706), P=5000)$out[[1]]
  # NOTE: calculated values *below* the transition are different
  expect_maxdiff(CHNOSZ_5000bar$G, S92_5000bar$G, 20)
  expect_maxdiff(CHNOSZ_5000bar$H, S92_5000bar$H, 300)
  expect_maxdiff(CHNOSZ_5000bar$S, S92_5000bar$S, 0.5)
  expect_maxdiff(CHNOSZ_5000bar$V, S92_5000bar$V, 0.05)
  obigt()
})

test_that("duplicated species yield correct phase transitions", {
  # If a mineral with phase transitions is in both the basis and species lists,
  # energy()'s call to subcrt() will have duplicated species.
  # This wasn't working (produced NAs at low T) for a long time prior to 20171003.
  s1 <- subcrt("chalcocite", T=c(100, 1000), P=1000)
  s2 <- subcrt(rep("chalcocite", 2), T=c(100, 1000), P=1000)
  expect_equal(s1$out[[1]]$logK, s2$out[[1]]$logK)
  expect_equal(s1$out[[1]]$logK, s2$out[[2]]$logK)
  ## another way to test it ...
  basis(c("copper", "chalcocite"))
  species("chalcocite")
  a <- affinity(T=c(0, 1000, 2), P=1)
  expect_equal(as.numeric(a$values[[1]]), c(0, 0))
})

test_that("reaction coefficients for repeated species are handled correctly", {
  # these were failing in version 1.1.3
  s1 <- subcrt(c("quartz", "SiO2"), c(-1, 1))            
  expect_equal(s1$reaction$coeff, c(-1, 1))
  s2 <- subcrt(c("pyrrhotite", "pyrrhotite"), c(-1, 1))            
  expect_equal(s2$reaction$coeff, c(-1, 1))
  # these were failing in version 1.1.3-28
  s3 <- subcrt(c("SiO2", "SiO2"), c(-1, 1))
  expect_equal(s3$reaction$coeff, c(-1, 1))
  s4 <- subcrt(c("H2O", "H2O", "H2O", "H2O", "H2O"), c(-2, 1, -3, 1, 3))
  expect_equal(s4$reaction$coeff, c(-2, 1, -3, 1, 3))
  # the reaction properties here should add up to zero
  expect_equal(unique(s4$out$logK), 0)
})

test_that("properties of HKF species below 0.35 g/cm3 are NA and give a warning", {
  wtext <- "below minimum density for applicability of revised HKF equations \\(2 T,P pairs\\)"
  expect_warning(s1 <- subcrt(c("Na+", "quartz"), T=450, P=c(400, 450, 500)), wtext) 
  expect_equal(sum(is.na(s1$out$`Na+`$logK)), 2)
  expect_equal(sum(is.na(s1$out$quartz$logK)), 0)
  # use exceed.rhomin to go below the minimum density
  s2 <- subcrt(c("Na+", "quartz"), T=450, P=c(400, 450, 500), exceed.rhomin=TRUE)
  expect_equal(sum(is.na(s2$out$`Na+`$logK)), 0)
})

test_that("combining minerals with phase transitions and aqueous species with IS > 0 does not mangle output", {
  # s2 was giving quartz an extraneous loggam column and incorrect G and logK 20181107
  add.obigt("SUPCRT92")
  s1 <- subcrt(c("quartz", "K+"), T=25, IS=1)
  s2 <- subcrt(c("K+", "quartz"), T=25, IS=1)
  expect_true(identical(colnames(s1$out[[1]]), c("T", "P", "rho", "logK", "G", "H", "S", "V", "Cp", "polymorph")))
  expect_true(identical(colnames(s2$out[[2]]), c("T", "P", "rho", "logK", "G", "H", "S", "V", "Cp", "polymorph")))
  expect_true(identical(colnames(s1$out[[2]]), c("T", "P", "rho", "logK", "G", "H", "S", "V", "Cp", "loggam", "IS")))
  expect_true(identical(colnames(s2$out[[1]]), c("T", "P", "rho", "logK", "G", "H", "S", "V", "Cp", "loggam", "IS")))
  # another one ... pyrrhotite was getting a loggam
  expect_true(identical(colnames(subcrt(c("iron", "Na+", "Cl-", "OH-", "pyrrhotite"), T=25, IS=1)$out$pyrrhotite),
    c("T", "P", "rho", "logK", "G", "H", "S", "V", "Cp", "polymorph")))
})

test_that("argument checking handles some types of invalid input", {
  expect_error(subcrt("H2O", -1, "liq", "xxx"), "invalid property name: xxx")
  # before version 1.1.3-63, having more than one invalid property gave a mangled error message
  expect_error(subcrt("H2O", -1, "liq", c(1, 2)), "invalid property names: 1 2")
})

# references

# Amend, J. P. and Shock, E. L. (2001) 
#   Energetics of overall metabolic reactions of thermophilic and hyperthermophilic Archaea and Bacteria. 
#   FEMS Microbiol. Rev. 25, 175--243. https://doi.org/10.1016/S0168-6445(00)00062-0

# Helgeson, H. C., Delany, J. M., Nesbitt, H. W. and Bird, D. K. (1978) 
#   Summary and critique of the thermodynamic properties of rock-forming minerals. 
#   Am. J. Sci. 278-A, 1--229. http://www.worldcat.org/oclc/13594862

