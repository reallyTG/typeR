context("swap.basis")

# clear out any previous basis definition or database alterations
suppressMessages(reset())

test_that("swap.basis raises errors when needed", {
  expect_error(swap.basis(c("CO2", "H2O")), "requires an existing basis definition")
  basis("CHNOS+")
  expect_error(swap.basis(c("CO2", "H2O")), "two species must be identified")
  expect_error(swap.basis(c("CO2", "H2O"), c("HCO3-", "H2O")), "can only swap one species for one species")
  expect_error(swap.basis("CH4", "C2H5OH"), "basis species .* is not defined")
  expect_error(swap.basis("CO2", "C60"), "is not available")
  expect_error(swap.basis("CO2", "H2"), "the number of basis species is greater than the number of elements and charge")
})

test_that("basis.logact only accepts defined elements", {
  # setup basis species with two elements: C and H
  basis(c("graphite", "H2"), c("cr", "gas"))
  # we can't get basis activities with one element
  expect_error(basis.logact(c(C=1)), "number of elements in 'emu' is less than those in basis")
  # get some potentials of C, H and O
  ispecies <- info(c("ethane", "propane", "acetic acid", "propanoic acid"))  
  w <- run.wjd(ispecies, as.chemical.formula(colMeans(i2A(ispecies))))
  ep <- equil.potentials(w)
  # try to calculate log activities of basis species: get an error
  expect_error(basis.logact(ep), "element\\(s\\) O not found in basis")
})

test_that("equil.potentials - basis.logact - element.mu makes a roundtrip at 25 and 99 degrees C", {
  basis(c("graphite", "H2", "O2"), c("cr", "gas", "gas"))
  ispecies <- info(c("ethane", "propane", "acetic acid", "propanoic acid"))  
  # at 25 degrees C
  w25 <- run.wjd(ispecies, as.chemical.formula(colMeans(i2A(ispecies))))
  ep25 <- equil.potentials(w25)
  bl25 <- basis.logact(ep25)
  # set the activities of the bais species
  basis(names(bl25), bl25)
  # element.mu() calculates the chemical potentials of the elements from the current setting of basis species
  expect_equal(element.mu(), ep25)
  # at 99 degrees C
  w99 <- run.wjd(ispecies, as.chemical.formula(colMeans(i2A(ispecies))), T=99)
  ep99 <- equil.potentials(w99)
  bl99 <- basis.logact(ep99, T=99)
  basis(names(bl99), bl99)
  expect_equal(element.mu(T=99), ep99)
})

# 20181111
test_that("swapping works with a buffer (no recalculation of activities)", {
  basis("FeCHNOS+")
  oldb <- basis("O2", "PPM")
  # before version 1.1.3-57, this gave Error in value * (-log(10) * R * T) : non-numeric argument to binary operator
  newb <- swap.basis("O2", "hydrogen")
  # note: logact includes "PPM" for O2 (old) and H2 (new)
  expect_identical(oldb$logact, newb$logact)
})
