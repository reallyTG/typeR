context('Testing whether GenomeScan finds a big signal accurately')

set.seed(seed = 27599)

# suppressPackageStartupMessages(library(SimHaploidPop))
#
# num_strains <- 2e2
# num_covariates <- 4
# num_snps <- 1e2
#
# orgs_per_strain <- sample(x = c(-2, -1, 0, 1, 2), size = num_strains, replace = TRUE) + 10
# true_strain_var <- rnorm(n = num_strains, mean = 10, sd = 2)
# se_mean_per_strain <- true_strain_var/sqrt(orgs_per_strain)
#
# covariate_mat <- matrix(data = sample(x = num_strains*num_covariates), nrow = num_strains)
# genotype_tbl <- SimHaploidPop(genome.size = num_snps, num.offspring = 2, mutation.rate = 0.1, stop.at.pop.size = num_strains)
# genotype_mat <- genotype_tbl %>% as.matrix()
# kinship_mat <- 1 - as.matrix(x = dist(x = genotype_mat, method = 'manhattan'))/num_snps
#
# # hc <- hclust(d = dist(x = genotype_mat, method = 'manhattan'))
# # lattice::levelplot(kinship_mat[hc$order, hc$order])
#
# num_one_snp <- sample(x = 1:num_snps, size = 1)
#
# A <- MASS::mvrnorm(n = 1,
#                    mu = 5*genotype_mat[, num_one_snp],
#                    Sigma = kinship_mat)
# E <- rnorm(n = num_strains, sd = se_mean_per_strain)
# y <- A + E
#
# locus_list <- lapply(X = as.data.frame(x = genotype_mat), FUN = as.matrix)

gs <- GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat)
wgs <- GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat, w = 1/se_mean_per_strain^2)

a <- gs$prep_scan()$conduct_scan()
b <- wgs$prep_scan()$conduct_scan()
# ma <- emma.ML.LRT(ys = as.matrix(y), xs = t(genotype_mat), K = kinship_mat, X0 = covariate_mat)
#
# plot(x = 2*(ma$ML1s - ma$ML0s), y = gs$Results$LR)
# abline(0, 1)
#
# plot(x = 2*(ma$ML1s - ma$ML0s), y = wgs$Results$LR)
# abline(0, 1)




test_that(desc = 'Conduct a scan',
          code = {


              a <- gs$prep_scan()$conduct_scan()
              # plot(a$Results$LR, col = replace(x = rep(1, num_snps), list = num_one_snp, values = 2), pch = 16)
              expect_equal(object = which.max(a$Results$LR), expected = 1)

              b <- wgs$prep_scan()$conduct_scan()
              # plot(b$Results$LR, col = replace(x = rep(1, num_snps), list = num_one_snp, values = 2), pch = 16)
              expect_equal(object = which.max(b$Results$LR), expected = 1)

          })