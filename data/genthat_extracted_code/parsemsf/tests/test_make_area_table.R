library(parsemsf)
context("Make area table")

pep_col_names <- c("peptide_id",
                   "spectrum_id",
                   "protein_desc",
                   "sequence",
                   "area",
                   "mass",
                   "m_z",
                   "charge",
                   "intensity",
                   "first_scan")

test_that("make_area_table creates a data frame with the correct column names", {
  expect_equal(colnames(make_area_table(parsemsf_example("test_db.msf"))), pep_col_names)
})
