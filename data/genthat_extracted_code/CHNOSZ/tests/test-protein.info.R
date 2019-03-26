context("protein.info")

# clear out any alterations to the database
suppressMessages(reset())

test_that("pinfo() deals with underscore in first argument", {
  expect_equal(pinfo("LYSC_CHICK"), 6)
})
test_that("pinfo() returns NA for unmatched protein_organism pairs", {
  expect_equal(pinfo(c("LYSC", "zzzz"), "CHICK"), c(6, NA))
})
test_that("pinfo() returns NA if no organism is given", {
  expect_equal(pinfo(c("LYSC_CHICK", "MYGPHYCA")), c(6, NA))
})

test_that("protein.equil() reports values consistent with Dick and Shock (2011)", {
  protein <- pinfo(c("CSG_METVO", "CSG_METJA"))
  suppressMessages(add.obigt("OldAA"))
  basis("CHNOS+")
  suppressMessages(swap.basis("O2", "H2"))
  pequil <- protein.equil(protein, loga.protein=-3)
  # the Astar/RT in the paragraph following Eq. 23, p. 6 of DS11
  # (truncated because of rounding)
  expect_true(any(grepl(c("0\\.435.*1\\.36"), pequil)))
  # the log10 activities of the proteins in the left-hand column of the same page
  expect_true(any(grepl(c("-3\\.256.*-2\\.834"), pequil)))
})

# references
# Dick, J. M. and Shock, E. L. (2011) Calculation of the relative chemical stabilities of proteins 
#   as a function of temperature and redox chemistry in a hot spring. 
#   PLoS ONE 6, e22782. https://doi.org/10.1371/journal.pone.0022782
