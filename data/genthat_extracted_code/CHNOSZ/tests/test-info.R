context("info")

test_that("info.character() produces expected results and messages", {
  expect_equal(info.character("acetate", "cr"), NA)
  expect_message(info.character("acetate", "cr"), "only 'aq' is available")
  expect_message(info.character("methane", "cr"), "only 'aq' 'liq' 'gas' are available")
  expect_message(info.character("methane"), "other available states are liq, gas")
  expect_message(info.character("SiO2", "cr"), "other available phases are")
  expect_message(info.character("chalcocite"), "found chalcocite\\(cr\\) with 2 phase transitions")
  # H2O is a special case
  expect_equal(info.character("H2O", "aq"), info.character("H2O", "liq"))
})

test_that("info.numeric() produces expected errors and messages", {
  expect_error(info.numeric(9999), "species index 9999 not found in thermo\\$obigt")
  iargon <- info("argon", "gas")
  expect_message(info.numeric(iargon), "Cp of argon\\(gas\\) is NA; set by EOS parameters to 4.97")
  iAlAc3 <- info("Am(Ac)3")
  expect_message(info.numeric(iAlAc3), "V of Am\\(Ac\\)3\\(aq\\) is NA; set by EOS parameters to 110.3")
})

test_that("info.approx() produces expected messages", {
  expect_message(info.approx("lactic"), "is similar to lactic acid")
  expect_message(info.approx("lactic acid"), "is ambiguous")
  # note though that info("lactic acid") finds a match because info.character is used first...
  expect_equal(info("lactic acid"), grep("lactic acid", thermo()$obigt$name))
  # looking in optional databases 20190127
  expect_message(info("dickite"), "is in an optional database")
})

test_that("info() can be used for cr and aq descriptions of the same species and proteins", {
  i2 <- info("LYSC_CHICK", c("cr", "aq")) 
  expect_equal(thermo()$obigt$state[i2], c("cr", "aq"))
  expect_equal(info(i2)[1, ], info(i2[1]), check.attributes=FALSE)
})

test_that("info() gives correct column names for species using the AkDi model", {
  # add an aqueous species conforming to the AkDi model: it has NA for Z
  iCO2 <- mod.obigt("CO2", a = -8.8321, b = 11.2684, c = -0.0850, z = NA)
  params <- info(iCO2)
  expect_equal(params$a, -8.8321)
  expect_equal(params$b, 11.2684)
  expect_equal(params$xi, -0.0850)
})
