context("Testing function sort_sequenom_df.R")

source("test_data_generator.R")

test_that("initialize_genotypeR produces the right class", {    

    test_data[is.na(test_data)] <- ""
    expect_equal(genotypes_data, sort_sequenom_df(genotypes_data[,c(1:2, 7, 3:6)]))

})

