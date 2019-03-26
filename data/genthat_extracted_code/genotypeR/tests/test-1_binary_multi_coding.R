context("Testing function binary and multi coding")

source("test_data_generator.R")

genotype_table <- Ref_Alt_Table(make_marker_names(fake_markers))

fake_geno_data <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="warnings2NA")

fake_geno_data_pass <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="pass_through")

##get expectation
##dcast(SAMPLE_NAME+WELL~MARKER, value.var =  "GENOTYPE", data=genotypes(fake_geno_data))
##naive_CO <- list(c(0,1,0,1), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
##non_naive_CO <- list(c(0,1,0.5,0.5), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))

test_that("The correctly code binary genotypes", {
fake_geno_binary <- binary_coding(fake_geno_data, genotype_table=genotype_table)

fake_geno_binary_test <- data.frame(structure(list(SAMPLE_NAME = c("test1", "test2", "test3", "test4", 
"test5"), WELL = c("WELL1", "WELL2", "WELL3", "WELL4", "WELL5"
), chrx_100_150 = c(NA, NA, NA, NA, "0"), chrx_200_250 = c("0", 
NA, "1", NA, NA), chrx_300_350 = c("1", "1", NA, NA, "0"), chrx_400_450 = c(NA_character_, 
NA_character_, NA_character_, NA_character_, NA_character_), 
    chrx_500_550 = c("0", NA, NA, NA, "0")), .Names = c("SAMPLE_NAME", 
"WELL", "chrx_100_150", "chrx_200_250", "chrx_300_350", "chrx_400_450", 
"chrx_500_550"), row.names = c(NA, -5L), class = "data.frame"))

expect_equal(binary_genotypes(fake_geno_binary), fake_geno_binary_test)
})

test_that("The correctly code multi genotypes", {
fake_geno_multi <- zero_one_two_coding(fake_geno_data_pass, genotype_table=genotype_table)

fake_geno_multi_test <- data.frame(structure(list(SAMPLE_NAME = c("test1", "test2", "test3", "test4", 
"test5"), WELL = c("WELL1", "WELL2", "WELL3", "WELL4", "WELL5"
), chrx_100_150 = c("0", NA, NA, NA, "2"), chrx_200_250 = c("2", 
NA, "1", NA, NA), chrx_300_350 = c("1", "1", NA, NA, "2"), chrx_400_450 = c(NA_character_, 
NA_character_, NA_character_, NA_character_, NA_character_), 
    chrx_500_550 = c("2", "0", "0", NA, "2")), .Names = c("SAMPLE_NAME", 
"WELL", "chrx_100_150", "chrx_200_250", "chrx_300_350", "chrx_400_450", 
"chrx_500_550"), row.names = c(NA, -5L), class = "data.frame"))

expect_equal(binary_genotypes(fake_geno_multi), fake_geno_multi_test)
})
