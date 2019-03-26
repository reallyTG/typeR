# test-berman.R 20171001
context("berman")

# get parameters for all available minerals
dat <- berman()
mineral <- unique(dat$name)
prop_Berman <- NULL

test_that("properties of all minerals are computed without warnings", {
  # running this without error means that:
  # - formulas for the minerals are found in thermo$obigt
  # - warning is produced for flourtremolite (GfPrTr(calc) >= 1000 J/cal different from GfPrTr(table))
  expect_warning(properties <- lapply(mineral, berman, check.G=TRUE),
                 "fluortremolite", all=TRUE)
  # save the results so we can use them in the next tests
  assign("prop_Berman", properties, inherits=TRUE)
})

# assemble a data frame for Berman properties
prop_Berman <- do.call(rbind, prop_Berman)
# find the mineral data using Helgeson formulation
icr <- suppressMessages(info(mineral, "cr"))
# all of these except rutile (Robie et al., 1979) reference Helgeson et al., 1978
# NOTE: with check.it = TRUE (the default), this calculates Cp from the tabulated Maier-Kelley parameters
add.obigt("SUPCRT92")
prop_Helgeson <- suppressMessages(info(icr))
obigt()

# now we can compare Berman and Helgeson G, H, S, Cp, V
# minerals with missing properties are not matched here
# (i.e. fluorphlogopite, fluortremolite, glaucophane, and pyrope: no G and H in prop_Helgeson data)

test_that("Berman and Helgeson tabulated properties have large differences for few minerals", {
  # which minerals differ in DGf by more than 4 kcal/mol?
  idiffG <- which(abs(prop_Berman$G - prop_Helgeson$G) > 4000)
  expect_match(mineral[idiffG],
               "paragonite|anthophyllite|antigorite|Ca-Al-pyroxene|lawsonite|margarite|merwinite")

  # which minerals differ in DHf by more than 4 kcal/mol?
  idiffH <- which(abs(prop_Berman$H - prop_Helgeson$H) > 4000)
  expect_match(mineral[idiffH],
               "paragonite|anthophyllite|antigorite|Ca-Al-pyroxene|lawsonite|margarite|merwinite|clinozoisite")

  # which minerals differ in S by more than 4 cal/K/mol?
  idiffS <- which(abs(prop_Berman$S - prop_Helgeson$S) > 4)
  expect_match(mineral[idiffS], "albite|annite|almandine|fluortremolite|andradite|grunerite")

  # which minerals differ in Cp by more than 4 cal/K/mol?
  idiffCp <- which(abs(prop_Berman$Cp - prop_Helgeson$Cp) > 4)
  expect_match(mineral[idiffCp], "glaucophane|antigorite|cristobalite,beta|K-feldspar|fluortremolite|grunerite")

  # which minerals differ in V by more than 1 cm^3/mol?
  idiffV <- which(abs(prop_Berman$V - prop_Helgeson$V) > 1)
  expect_match(mineral[idiffV], "glaucophane|anthophyllite|antigorite|chrysotile|merwinite|grunerite")
})

test_that("high-T,P calculated properties are similar to precalculated ones", {
  # Reference values for G were taken from the spreadsheet Berman_Gibbs_Free_Energies.xlsx
  #   (http://www.dewcommunity.org/uploads/4/1/7/6/41765907/sunday_afternoon_sessions__1_.zip accessed on 2017-10-03)
  T <- c(100, 100, 1000, 1000)
  P <- c(5000, 50000, 5000, 50000)

  # anadalusite: an uncomplicated mineral (no transitions)
  And_G <- c(-579368, -524987, -632421, -576834)
  And <- subcrt("andalusite", T=T, P=P)$out[[1]]
  expect_maxdiff(And$G, And_G, 7.5)

  # quartz: a mineral with polymorphic transitions
  aQz_G <- c(-202800, -179757, -223864, -200109)
  aQz <- subcrt("quartz", T=T, P=P)$out[[1]]
  expect_maxdiff(aQz$G[-2], aQz_G[-2], 1.2)
  # here, the high-P, low-T point suffers
  expect_maxdiff(aQz$G[2], aQz_G[2], 1250)

  # K-feldspar: this one has disordering effects
  Kfs_G <- c(-888115, -776324, -988950, -874777)
  Kfs <- subcrt("K-feldspar", T=T, P=P)$out[[1]]
  expect_maxdiff(Kfs$G[1:2], Kfs_G[1:2], 5)
  # we are less consistent with the reference values at high T
  expect_maxdiff(Kfs$G[3:4], Kfs_G[3:4], 350)
})

test_that("nonexistent or incomplete user data file is handled properly", {
  thermo("opt$Berman" = "XxXxXx.csv")
  expect_error(berman("calcite"), "the file named in thermo\\$opt\\$Berman \\(XxXxXx.csv\\) does not exist")
  thermo("opt$Berman" = system.file("extdata/Berman/testing/BA96_berman.csv", package="CHNOSZ"))
  expect_error(berman("xxx"), "Data for xxx not available. Please add it to")
  thermo("opt$Berman" = NA)
  expect_error(berman("xxx"), "Data for xxx not available. Please add it to your_data_file.csv")
})

test_that("NA values of P are handled", {
  sresult <- subcrt("H2O", T = seq(0, 500, 100))
  T <- sresult$out$water$T
  P <- sresult$out$water$P
  # this stopped with a error prior to version 1.1.3-37
  bresult <- berman("quartz", T = convert(T, "K"), P = P)
  expect_equal(sum(is.na(bresult$G)), 2)
  # this also now works (producing the same NA values)
  #subcrt("quartz", T = seq(0, 500, 100))
})
