context("solubility")

test_that("solubility() produces stable conditions (affinity = 0)", {
  # set pH range and resolution, constant temperature and ionic strength
  pH <- c(0, 14)
  res <- 100
  T <- 25
  IS <- 0

  ## start with CO2
  basis(c("carbon dioxide", "H2O", "O2", "H+"))
  # ca. atmospheric PCO2
  basis("CO2", -3.5)
  species(c("CO2", "HCO3-", "CO3-2"))
  a <- affinity(pH = c(pH, res), T = T, IS = IS)
  s <- solubility(a)
  # a function to check for stable conditions (affinity = 0)
  # do this by setting activities in species() then calculating the affintiy
  checkfun <- function(i) {
    logact <- sapply(s$loga.equil, "[", i)
    species(1:3, logact)
    basis("pH", s$vals[[1]][i])
    affinity(T = T, IS = IS)
  }
  # check any 'i' here - let's just take two
  expect_equal(max(abs(unlist(checkfun(33)$values))), 0)
  expect_equal(max(abs(unlist(checkfun(99)$values))), 0)

  # now do calcite
  basis(c("calcite", "Ca+2", "H2O", "O2", "H+"))
  species(c("CO2", "HCO3-", "CO3-2"))
  a <- affinity(pH = c(pH, res), T = T, IS = IS)
  s <- solubility(a)
  # here we need to also set the activity of Ca+2
  checkfun <- function(i) {
    logact <- sapply(s$loga.equil, "[", i)
    species(1:3, logact)
    basis("pH", s$vals[[1]][i])
    basis("Ca+2", s$loga.balance[i])
    affinity(T = T, IS = IS)
  }
  expect_equal(max(abs(unlist(checkfun(33)$values))), 0)
  expect_equal(max(abs(unlist(checkfun(99)$values))), 0)
})

test_that("solubility() catches some error conditions", {
  # demo(solubility) has basis(c("calcite", "Ca+2", "H2O", "O2", "H+")), but what if the user puts H2O second?
  basis(c("calcite", "H2O", "Ca+2", "O2", "H+"))
  species(c("CO2", "HCO3-", "CO3-2"))
  a <- affinity()
  expect_error(solubility(a), "Unsure whether the first formation reaction is a dissociation reaction.")
})
