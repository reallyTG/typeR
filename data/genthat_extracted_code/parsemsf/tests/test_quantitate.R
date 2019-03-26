library(parsemsf)
library(dplyr, warn.conflicts = FALSE)
context("Combine technical replicates and quantitate proteins")

pep_col_names <- c("area_mean",
                   "area_sd",
                   "peps_per_rep")

rep1 <- make_area_table(parsemsf_example("test_db.msf")) %>% mutate(tech_rep = 1)
rep2 <- make_area_table(parsemsf_example("test_db2.msf")) %>% mutate(tech_rep = 2)
reps <- bind_rows(rep1, rep2)

test_that("merge_top_peptides creates a data frame with the correct column names", {
  expect_equal(colnames(merge_top_peptides(reps, 2)), pep_col_names)
})

pep_col_names <- c("protein_desc",
                   "area_mean",
                   "area_sd",
                   "peps_per_rep")

test_that("quantitate creates a data frame with the correct column names", {
  expect_equal(colnames(quantitate(reps = c(parsemsf_example("test_db.msf"),
                                            parsemsf_example("test_db2.msf")))), pep_col_names)
})


