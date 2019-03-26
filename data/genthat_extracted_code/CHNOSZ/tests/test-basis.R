context("basis")

# clear out any previous basis definition or database alterations
suppressMessages(reset())

test_that("invalid basis definitions cause an error", {
  expect_error(basis(character()), "argument is empty")
  expect_error(basis(c("CO2", "CO2")), "names are not unique")
  expect_error(basis(c("CO2", "H2O")), "the number of basis species is less than the number of elements")
  expect_error(basis(c("H2O", "O2", "H2")), "the number of basis species is greater than the number of elements")
  expect_error(basis(c("HCN", "H2O", "O2", "H2")), "singular")
  expect_error(basis(c("CN", "H2O", "O2", "H2")), "species not available")
  expect_error(basis(c("CN")), "species not available")
  ina <- nrow(thermo()$obigt) + 1
  expect_error(basis(ina), "species not available")
  expect_error(preset.basis(c("CN")), "is not a keyword")
  # after all that, the basis should still be undefined
  expect_is(basis(), "NULL")
})

test_that("invalid basis modification requests cause an error", {
  basis(delete=TRUE)
  expect_error(mod.basis("CH4", "gas"), "basis is not defined")
  b <- basis("CHNOS+")
  expect_error(mod.basis("CH4", "gas"), "is not a formula of one of the basis species")
  iCH4 <- info("CH4")
  expect_error(mod.basis(iCH4, "gas"), "is not a species index of one of the basis species")
  expect_error(mod.basis("CO2", "PPM"), "the elements .* in buffer .* are not in the basis")
  expect_error(mod.basis("CO2", "liq"), "state .* not found")
  # after all that, the basis should be unchanged
  expect_equal(basis(), b)
})

test_that("modifying states of basis species is possible", {
  b1 <- basis(c("copper", "chalcocite"))
  b2 <- basis("Cu2S", "cr2")
  # we went from chalcocite cr to cr2, which is the next row in the database
  expect_equal(sum(b2$ispecies - b1$ispecies), 1)
  expect_error(basis("Cu2S", "cr4"), "state or buffer 'cr4' not found for chalcocite")
  # can we go from CO2(aq) to CO2(gas) back to CO2(aq)?
  basis("CHNOS+")  # first basis species is CO2(aq)
  expect_equal(basis("CO2", "gas")$state[1], "gas")
  expect_equal(basis("CO2", "aq")$state[1], "aq")
})
