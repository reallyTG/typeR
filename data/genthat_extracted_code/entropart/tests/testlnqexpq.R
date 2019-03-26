context("lnq")

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Community profiles of enntropy and diversity
ecp <- CommunityProfile(Tsallis, Paracou618.MC$Ps, seq(0, 2, 0.2))
dcp <- CommunityProfile(Diversity, Paracou618.MC$Ps, seq(0, 2, 0.2))

# Check that 
test_that("Exponential of entropy equals diverssity", {
  skip_on_cran()
  # Exponential
  expect_equal(expq.CommunityProfile(ecp),
               dcp,
               tolerance = 1e-6)
  # Logarithm
  expect_equal(lnq.CommunityProfile(dcp),
               ecp,
               tolerance = 1e-6)
})
