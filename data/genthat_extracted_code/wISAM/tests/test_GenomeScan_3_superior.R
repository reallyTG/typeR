# context('Testing whether weighted GenomeScan is superior to unweighted')

# set.seed(seed = 27599)
#
# suppressPackageStartupMessages(library(SimHaploidPop))
#
# num_strains <- 2e2
# num_covariates <- 4
# num_snps <- 1e2
#
# strain_var <- rnorm(n = num_strains, mean = 10, sd = 2)
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
#                    mu = rep(0, num_strains),
#                    # mu = 5*genotype_mat[, num_one_snp],
#                    Sigma = kinship_mat)
# unscaled_E <- rnorm(n = num_strains)
# E <- unscaled_E * sqrt(strain_var)
#
# y_hom <- A + unscaled_E
# y_het <- A + E
#
# locus_list <- lapply(X = as.data.frame(x = genotype_mat), FUN = as.matrix)
#
# gs <- GenomeScan$new(y = y_hom, X = covariate_mat, G = locus_list, K = kinship_mat)
# a <- gs$prep_scan()$conduct_scan()
#
# wgs <- GenomeScan$new(y = y_het, X = covariate_mat, G = locus_list, K = kinship_mat, w = se_mean_per_strain)
# b <- wgs$prep_scan()$conduct_scan()
#
# # lims = c(-2100, -1000)
# plot(x = gs$Results$LR, wgs$Results$LR)#, xlim = lims, ylim = lims)
# abline(0, 1)
#

# test_that(desc = 'Conduct a scan',
#           code = {
#
#
#               a <- gs$prep_scan()$conduct_scan()
#               # plot(a$Results$LR, col = replace(x = rep(1, num_snps), list = num_one_snp, values = 2), pch = 16)
#               expect_equal(object = which.max(a$Results$LR), expected = num_one_snp)
#
#               b <- wgs$prep_scan()$conduct_scan()
#               # plot(b$Results$LR, col = replace(x = rep(1, num_snps), list = num_one_snp, values = 2), pch = 16)
#               expect_equal(object = which.max(b$Results$LR), expected = num_one_snp)
#
#           })