library(testthat)
library(Matrix)
context("sim_RVstudy")

data("study_peds")
data("EXhaps")
data("EXmuts")

#SMALL TOY DATASETS FOR TESTING
toy_haps <- sparseMatrix(i = seq(1:10), j = seq(1:10), x = rep(1, 10))
toy_muts <- data.frame(colID = seq(1:10),
                       chrom = rep(1, 10),
                       position = round(seq(1001, 2000001, length.out = 10)*1000),
                       pathwaySNV = sample(x = c(TRUE, FALSE), size = 10,
                                           replace = TRUE, prob = c(0.2, 0.8)),
                       is_CRV = sample(c(rep(FALSE, 9), TRUE), size = 10))

toy_muts$marker = paste0(toy_muts$chrom, sep = "_", toy_muts$position)

#---------------------#
# Errors and Warnings #
#---------------------#

test_that("Warning: some pedigrees do not contain affecteds and affected_only = TRUE", {

  red_peds <- study_peds
  red_peds$affected[red_peds$FamID %in% sample(1:5, size = 2)] = FALSE


  expect_warning(sim_RVstudy(ped_files = red_peds,
                             SNV_map = EXmuts,
                             haplos = EXhaps))
})


test_that("Error: pedigrees do not contain any affecteds and affected_only = TRUE", {

  red_peds <- study_peds
  red_peds$affected = FALSE

  expect_error(sim_RVstudy(ped_files = red_peds,
                             SNV_map = EXmuts,
                             haplos = EXhaps))
})

test_that("Warning if is_CRV is missing from SNV_map", {

  expect_warning(sim_RVstudy(ped_files = study_peds,
                             SNV_map = toy_muts[, -5],
                             haplos = toy_haps,
                             remove_wild = FALSE,
                             affected_only = TRUE))
})

test_that("Error: nrow(SNV_map) != ncol(haplos)", {

  expect_error(sim_RVstudy(ped_files = study_peds,
                           SNV_map = EXmuts[-1, ],
                           haplos = EXhaps))
})

test_that("Error if mutiple RV founders in pedigree", {

  #choose a family from study peds
  test_fam = sample(x = c(1:5), size = 1)
  red_peds <- study_peds[study_peds$FamID == test_fam, ]
  rownames(red_peds) = NULL

  founder_locs <- which(is.na(red_peds$dadID))

  #set DA1 to 1 for at least 2 founders
  red_peds$DA1[sample(founder_locs, size = 3)] <- 1

  expect_error(sim_RVstudy(ped_files = red_peds,
                           SNV_map = toy_muts,
                           haplos = toy_haps,
                           remove_wild = FALSE,
                           affected_only = TRUE))
})


test_that("Error if de novo mutations detected", {

  #choose a family from study peds
  test_fam = sample(x = c(1:5), size = 1)
  red_peds <- study_peds[study_peds$FamID == test_fam, ]
  rownames(red_peds) = NULL

  nonfounder_locs <- which(!is.na(red_peds$dadID) & red_peds$DA1 == 0)
  de_novo_subject <- sample(nonfounder_locs, size = 1)

  #set DA1 and DA2 to 1 for sampled subject
  red_peds$DA1[de_novo_subject] <- 1
  red_peds$DA2[de_novo_subject] <- 1

  expect_error(sim_RVstudy(ped_files = red_peds,
                           SNV_map = toy_muts,
                           haplos = toy_haps,
                           remove_wild = FALSE,
                           affected_only = FALSE))
})


#----------------#
# Output testing #
#----------------#

test_that("rows of haplo_map are equal to rows ped_haplos", {

  study_seq <- sim_RVstudy(ped_files = study_peds,
                           SNV_map = toy_muts,
                           haplos = toy_haps,
                           remove_wild = FALSE,
                           affected_only = TRUE)

  expect_equal(nrow(study_seq$ped_haplos), nrow(study_seq$haplo_map))
})



test_that("sproadic families to do carry ANY crvs in pool", {
  #create a fully sporadic sample
  sp_peds <- study_peds
  sp_peds$DA1 <- 0
  sp_peds$DA2 <- 0

  #sample SNVs to be in the causal pool
  toy_muts2 <- toy_muts
  toy_muts2$is_CRV = FALSE
  while (sum(toy_muts2$is_CRV) == 0) {
    toy_muts2$is_CRV <- sample(x = c(TRUE, FALSE),
                               size = 10,
                               prob = c(0.2, 0.8),
                               replace = TRUE)
  }

  #simulate sequence data for study
  study_seq <- sim_RVstudy(ped_files = sp_peds,
                           SNV_map = toy_muts2,
                           haplos = toy_haps,
                           remove_wild = FALSE,
                           affected_only = TRUE)

  cRV_colSums <- colSums(study_seq$ped_haplos)[which(toy_muts2$is_CRV == TRUE)]

  expect_equal(cRV_colSums, rep(0, length(cRV_colSums)))

})


test_that("affecteds from genetic families carry the correct number of cRVs at famlial locus", {
  #sample SNVs to be in the causal pool
  toy_muts2 <- toy_muts
  toy_muts2$is_CRV = FALSE
  while (sum(toy_muts2$is_CRV) == 0) {
    toy_muts2$is_CRV <- sample(x = c(TRUE, FALSE),
                               size = 10,
                               prob = c(0.2, 0.8),
                               replace = TRUE)
  }

  test_fam = sample(x = c(1, 3, 4, 5), size = 1)

  #simulate sequence data for study
  study_seq <- sim_RVstudy(ped_files = study_peds[study_peds$FamID == test_fam, ],
                           SNV_map = toy_muts2,
                           haplos = toy_haps,
                           remove_wild = FALSE,
                           affected_only = TRUE)

  num_affected <- sum(study_peds$affected[study_peds$FamID == test_fam])

  fam_RVcount <- colSums(study_seq$ped_haplos[study_seq$haplo_map$affected, ])[which(toy_muts2$marker == study_seq$haplo_map$FamCRV[1])]

  expect_equal(fam_RVcount, num_affected)
})
