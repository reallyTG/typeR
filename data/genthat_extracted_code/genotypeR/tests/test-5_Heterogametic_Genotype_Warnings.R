context("Testing function Heterogametic_Genotype_Warnings.R")

source("test_data_generator.R")

##tests
test_that("The corretly identify Het. Males; an impossible genotype", {    

   Het_Gam <- Heterogametic_Genotype_Warnings(genotypes_data, sex_chromosome="chrx", sex_vector=rep("M", 5), heterogametic_sex="M")

   expect_equal(as.character(Het_Gam$MARKER), c("chrx_200_250", "chrx_300_350", "chrx_300_350"))
})
