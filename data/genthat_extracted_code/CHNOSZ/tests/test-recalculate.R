context("recalculate")

# SK95: Shock and Korestky, 1995
# doi:10.1016/0016-7037(95)00058-8
test_that("recalculated values from SK95 are correctly entered in OBIGT", {
  # test added 20190206
  # thermodynamic data entries for amino acid glycinate and alanate complexes
  # (no longer in default database)
  reset()
  add.obigt("OldAA")
  iaa <- info(c("alanate", "glycinate"))
  iGly <- grep("\\(Gly\\)\\+$", thermo()$obigt$name)
  iGly2 <- grep("\\(Gly\\)2$", thermo()$obigt$name)
  iAla <- grep("\\(Ala\\)\\+$", thermo()$obigt$name)
  iAla2 <- grep("\\(Ala\\)2$", thermo()$obigt$name)
  # get values used in OBIGT
  aa_GHS_OBIGT <- thermo()$obigt[iaa, c("G", "H", "S")]
  Gly_GHS_OBIGT <- thermo()$obigt[iGly, c("G", "H", "S")]
  Gly2_GHS_OBIGT <- thermo()$obigt[iGly2, c("G", "H", "S")]
  Ala_GHS_OBIGT <- thermo()$obigt[iAla, c("G", "H", "S")]
  Ala2_GHS_OBIGT <- thermo()$obigt[iAla2, c("G", "H", "S")]
  # get values from SK95
  SK95 <- system.file("extdata/adds/SK95.csv", package="CHNOSZ")
  add.obigt(SK95)
  aa_GHS_SK95 <- thermo()$obigt[iaa, c("G", "H", "S")]
  Gly_GHS_SK95 <- thermo()$obigt[iGly, c("G", "H", "S")]
  Gly2_GHS_SK95 <- thermo()$obigt[iGly2, c("G", "H", "S")]
  Ala_GHS_SK95 <- thermo()$obigt[iAla, c("G", "H", "S")]
  Ala2_GHS_SK95 <- thermo()$obigt[iAla2, c("G", "H", "S")]
  # calculate differences for alanate and glycinate
  # nb. round values to avoid floating-point difficulties with unique() etc.
  Ala_GHS_Delta <- round(aa_GHS_SK95[1, ] - aa_GHS_OBIGT[1, ], 2)
  Gly_GHS_Delta <- round(aa_GHS_SK95[2, ] - aa_GHS_OBIGT[2, ], 2)
  # test that the differences are the same in the corresponding complexes
  expect_equivalent(Gly_GHS_Delta, unique(round(Gly_GHS_SK95 - Gly_GHS_OBIGT, 2)))
  expect_equivalent(Gly_GHS_Delta, unique(round((Gly2_GHS_SK95 - Gly2_GHS_OBIGT)/2, 2)))
  expect_equivalent(Ala_GHS_Delta, unique(round(Ala_GHS_SK95 - Ala_GHS_OBIGT, 2)))
  expect_equivalent(Ala_GHS_Delta, unique(round((Ala2_GHS_SK95 - Ala2_GHS_OBIGT)/2, 2)))
  # clean up
  reset()
})

# SSH97: Sverjensky et al., 1997
# doi:10.1016/S0016-7037(97)00009-4
test_that("recalculated values for HSiO3- match those in original reference", {
  iSiO2 <- info("SiO2")
  iHSiO3 <- info("HSiO3-")
  # get values used in OBIGT
  reset()
  SiO2_GHS_OBIGT <- thermo()$obigt[iSiO2, c("G", "H", "S")]
  HSiO3_GHS_OBIGT <- thermo()$obigt[iHSiO3, c("G", "H", "S")]
  # get values from SSH97
  add.obigt("SLOP98")
  SiO2_GHS_SSH97 <- thermo()$obigt[iSiO2, c("G", "H", "S")]
  HSiO3_GHS_SSH97 <- thermo()$obigt[iHSiO3, c("G", "H", "S")]
  # calculate differences
  OBIGT_Delta <- HSiO3_GHS_OBIGT - SiO2_GHS_OBIGT
  SSH97_Delta <- HSiO3_GHS_SSH97 - SiO2_GHS_SSH97
  # perform test
  expect_equal(OBIGT_Delta, SSH97_Delta)
  # clean up
  reset()
})
