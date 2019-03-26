context("eos")

test_that("cgl() with NA volume produces reasonable results", {
  # 20171006: after rewriting much of the code in cgl(), melanterite and hydronium jarosite
  # disappeared from the example diagram after Majzlan et al., 2006.
  # Because the volumes are NA, the integral properties became NA,
  # but it makes more sense to set them to zero.
  ispecies <- info("melanterite")
  expect_equal(info(ispecies)$V, NA_real_)
  sout <- subcrt(ispecies, T=c(25, 25, 100, 100), P=c(1, 100, 1, 100))$out[[1]]
  expect_false(any(is.na(sout$H)))
  # for melanterite, which is listed in the database with zero heat capacity,
  # all Cp and V integrals evaluate to zero
  expect_length(unique(sout$H), 1)
})

test_that("gfun() gives expected results", {
  # calculate values of g and its derivatives 
  # up to 350 degrees C at Psat
  Tc <- c(0, 25, 50, 100, 150, 200, 250, 300, 350)
  # get the required properties of water
  w <- water(c("rho", "alpha", "daldT", "beta", "Psat"), T=convert(Tc, "K"), P="Psat")
  # calculate g and its derivatives
  gfun.Psat <- gfun(w$rho/1000, Tc, w$Psat, w$alpha, w$daldT, w$beta)
  # up to 450 degrees C at 500 bar
  Tc <- c(Tc, 400, 450)
  w <- water(c("rho", "alpha", "daldT", "beta"), T=convert(Tc, "K"), P=500)
  gfun.500 <- gfun(w$rho/1000, Tc, rep(500, length(Tc)), w$alpha, w$daldT, w$beta)
  # up to 600 degrees C at 1000 bar
  Tc <- c(Tc, 500, 550, 600)
  w <- water(c("rho", "alpha", "daldT", "beta"), T=convert(Tc, "K"), P=1000)
  gfun.1000 <- gfun(w$rho/1000, Tc, rep(1000, length(Tc)), w$alpha, w$daldT, w$beta)
  # up to 1000 degrees C at 4000 bar
  Tc <- c(Tc, 700, 800, 900, 1000)
  w <- water(c("rho", "alpha", "daldT", "beta"), T=convert(Tc, "K"), P=4000)
  gfun.4000 <- gfun(w$rho/1000, Tc, rep(4000, length(Tc)), w$alpha, w$daldT, w$beta)

  # values from table 5 of Shock et al., 1992
  g.Psat.ref <- c(0, 0, 0, 0, -0.09, -1.40, -8.05, -35.23, -192.05)
  g.500.ref <- c(0, 0, 0, 0, -0.02, -0.43, -3.55, -16.81, -56.78, -287.16, -1079.75)
  g.1000.ref <- c(0, 0, 0, 0, 0, -0.12, -1.49, -8.44, -30.59, -85.09, -201.70, -427.17, -803.53, -1312.67)
  g.4000.ref <- c(0, 0, 0, 0, 0, 0, 0, -0.01, -0.20, -1.14, -3.52, -7.84, -14.19, -22.21, -40.15, -54.28, -59.35, -55.17)
  # compare the calculations with the reference values
  # note: tolerance is set as low as possible (order of magnitude) for successful tests
  expect_equal(gfun.Psat$g * 1e4, g.Psat.ref, tolerance=1e-4)
  expect_equal(gfun.500$g  * 1e4, g.500.ref,  tolerance=1e-4)
  expect_equal(gfun.1000$g * 1e4, g.1000.ref, tolerance=1e-5)
  expect_equal(gfun.4000$g * 1e4, g.4000.ref, tolerance=1e-4)

  # values from table 6 of Shock et al., 1992
  dgdT.Psat.ref <- c(0, 0, 0, -0.01, -0.62, -6.13, -25.33, -123.20, -1230.59)
  dgdT.500.ref <- c(0, 0, 0, 0, -0.13, -2.21, -12.54, -46.50, -110.45, -734.92, -2691.41)
  dgdT.1000.ref <- c(0, 0, 0, 0, -0.02, -0.75, -6.12, -24.83, -69.29, -158.38, -324.13, -594.43, -904.41, -1107.84)
  dgdT.4000.ref <- c(0, 0, 0, 0, 0, 0, 0, -0.08, -0.89, -3.09, -6.60, -10.72, -14.55, -17.29, -17.26, -10.06, -0.08, 7.82)
  expect_equal(gfun.Psat$dgdT * 1e6, dgdT.Psat.ref, tolerance=1e-2)
  expect_equal(gfun.500$dgdT  * 1e6, dgdT.500.ref,  tolerance=1e-2)
  expect_equal(gfun.1000$dgdT * 1e6, dgdT.1000.ref, tolerance=1e-5)
  expect_equal(gfun.4000$dgdT * 1e6, dgdT.4000.ref, tolerance=1e-3)

  # values from table 7 of Shock et al., 1992
  d2gdT2.Psat.ref <- c(0, 0, 0, -0.1, -3.7, -20.7, -74.3, -527.8, -15210.4)
  d2gdT2.500.ref <- c(0, 0, 0, 0, -1.0, -9.3, -36.8, -109.4, -26.3, -2043.5, -4063.1)
  d2gdT2.1000.ref <- c(0, 0, 0, 0, -0.2, -4.0, -20.5, -58.4, -125.4, -241.8, -433.9, -628.0, -550.0, -265.2)
  d2gdT2.4000.ref <- c(0, 0, 0, 0, 0, 0, 0, -0.6, -2.9, -5.9, -7.9, -8.2, -6.8, -3.9, 4.0, 9.5, 9.6, 5.9)
  expect_equal(gfun.Psat$d2gdT2 * 1e8, d2gdT2.Psat.ref, tolerance=1e-5)
  expect_equal(gfun.500$d2gdT2  * 1e8, d2gdT2.500.ref,  tolerance=1e-4)
  expect_equal(gfun.1000$d2gdT2 * 1e8, d2gdT2.1000.ref, tolerance=1e-4)
  expect_equal(gfun.4000$d2gdT2 * 1e8, d2gdT2.4000.ref, tolerance=1e-2)

  # values from table 8 of Shock et al., 1992
  dgdP.Psat.ref <- c(0, 0, 0, 0, 0.03, 0.36, 1.92, 12.27, 227.21)
  dgdP.500.ref <- c(0, 0, 0, 0, 0.01, 0.53, 1.75, 5.69, 107.61, 704.88, 1110.20)
  dgdP.1000.ref <- c(0, 0, 0, 0, 0, 0.03, 0.31, 1.50, 5.25, 15.53, 4.78, 101.39, 202.25, 313.90)
  dgdP.4000.ref <- c(0, 0, 0, 0, 0, 0, 0, 0, 0.05, 0.18, 0.46, 0.91, 1.54, 2.34, 4.26, 6.12, 7.29, 7.47)
  expect_equal(gfun.Psat$dgdP * 1e6, dgdP.Psat.ref, tolerance=1e-0)
  expect_equal(gfun.500$dgdP  * 1e6, dgdP.500.ref,  tolerance=1e+1)
  expect_equal(gfun.1000$dgdP * 1e6, dgdP.1000.ref, tolerance=1e-1)
  expect_equal(gfun.4000$dgdP * 1e6, dgdP.4000.ref, tolerance=1e-3)
})

test_that("AkDi produces expected results", {
  # 20190220
  # modify aqueous CO2 to use the AkDi model: it has NA for Z
  iCO2 <- mod.obigt("CO2", a=-8.8321, b=11.2684, c=-0.0850, z=NA)
  # do the properties we calculate match previously calculated values?
  P <- "Psat"
  T <- seq(50, 350, 100)
  # J mol-1
  G_ref <- c(-389122.3, -405138.4, -425410.7, -450573.2)
  G_calc <- subcrt(iCO2, T=T, P=P)$out[[1]]$G
  # convert to J mol-1
  G_calc <- convert(G_calc, "J", T=convert(T, "K"))
  expect_equal(round(G_calc, 1), G_ref)

  P <- 500
  T <- seq(200, 1000, 200)
  G_ref <- c(-412767.4, -459654.1, -515231.6, -565736.3, -617927.9)
  G_calc <- subcrt(iCO2, T=T, P=P)$out[[1]]$G
  G_calc <- convert(G_calc, "J", T=convert(T, "K"))
  expect_equal(round(G_calc, 1), G_ref)

  # compare Gibbs energies at 25 degrees calculated with AkDi model to database values
  iAkDi <- add.obigt("AkDi")
  # remove Si(OH)4 and As(OH)3 because no HKF aqueous species are available
  iAkDi <- head(iAkDi, -2)
  # this would produce an error if any of the corresponding gases were unavailable
  sAkDi <- subcrt(iAkDi, T = 25)
  GAkDi <- do.call(rbind, sAkDi$out)$G
  # now get the parameters from default OBIGT
  reset()
  GOBIGT <- info(iAkDi)$G
  # calculate the differences and add names
  Gdiff <- GAkDi - GOBIGT
  names(Gdiff) <- info(iAkDi)$name
  # the differences are not that big, except for HCl(aq)
  expect_lt(max(abs(Gdiff)), 300)
})

# reference

# Shock, E. L., Oelkers, E. H., Johnson, J. W., Sverjensky, D. A. and Helgeson, H. C. (1992) 
#   Calculation of the thermodynamic properties of aqueous species at high pressures and temperatures: 
#   Effective electrostatic radii, dissociation constants and standard partial molal properties to 1000 degrees C and 5 kbar. 
#   J. Chem. Soc. Faraday Trans. 88, 803--826. https://doi.org/10.1039/FT9928800803
