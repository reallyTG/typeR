library(parsemsf)
context("Map peptides")

pep_col_names <- c("peptide_id",
                   "spectrum_id",
                   "protein_id",
                   "protein_desc",
                   "peptide_sequence",
                   "pep_score",
                   "q_value",
                   "protein_sequence",
                   "start",
                   "end")

test_that("map_peptides creates a data frame with the correct column names", {
  expect_equal(colnames(map_peptides(parsemsf_example("test_db.msf"))), pep_col_names)
})
