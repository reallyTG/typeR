# test-loadStructure.R
context("checks for loadStructure")

structure_files <- system.file("extdata/microsat_testfiles", package="starmie")
structure_output_files <- list.files(structure_files, pattern = ".*out_f", full.names = TRUE)
structure_log_files <- list.files(structure_files, pattern = ".*log", full.names = TRUE)

test_that("loadStructure I/O checks", {
  expect_error(loadStructure(1, structure_log_files[[1]]), "filename must be a string.")
  expect_error(loadStructure(structure_output_files[[1]], 1), "logfile must be a string.")
})

k10_r1 <-structure_output_files[grepl("locprior_K10.out_f$",
                                      structure_output_files)][1]
k6_log <- structure_log_files[grepl("^chain_K6.log",
                              basename(structure_log_files))]
test_that("loadStructure population mismatch check", {
  expect_error(loadStructure(k10_r1, k6_log)
               , "Population mismatch between output and logfile.")
})
