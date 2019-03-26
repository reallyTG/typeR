library(testthat)
context("sim_gameteInheritance")

test_that("Test that sim_gameteInheritance returns RV allele when both
          parent and child have the RV", {


            #set up a simple scenario: only looking at the RV locus, i.e. 1 SNV
            my_chrom_map <- data.frame(chrom = 1,
                                       start = 1,
                                       stop = 1)
            RVL <- data.frame(chrom = 1,
                              postition = 1)

            parent_alleles <- data.frame(Par_DA1 = 1,
                                         Par_DA2 = 0)

            inheritedAllele <- sim_gameteInheritance(RV_locus = RVL,
                                                     parent_RValleles = parent_alleles,
                                                     offspring_RVstatus = 1,
                                                     chrom_map = my_chrom_map,
                                                     allele_IDs = c(1, 2))[[1]]

            expect_equal(unlist(inheritedAllele), 1)

          })



test_that("Test that sim_gameteInheritance does not return RV allele when
          parent has RV but child does not", {


            #set up a simple scenario: only looking at the RV locus, i.e. 1 SNV
            my_chrom_map <- data.frame(chrom = 1,
                                       start = 1,
                                       stop = 1)
            RVL <- data.frame(chrom = 1,
                              postition = 1)

            parent_alleles <- data.frame(Par_DA1 = 1,
                                         Par_DA2 = 0)

            inheritedAllele <- sim_gameteInheritance(RV_locus = RVL,
                                                     parent_RValleles = parent_alleles,
                                                     offspring_RVstatus = 0,
                                                     chrom_map = my_chrom_map,
                                                     allele_IDs = c(1, 2))[[1]]

            expect_equal(unlist(inheritedAllele), 2)

          })
