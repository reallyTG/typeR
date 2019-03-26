context('Testing whether GenomeScan runs without error')

set.seed(seed = 27599)

num_strains <- 2e2
num_covariates <- 4
num_snps <- 1e2

se_mean_per_strain <- rep(x = sqrt(x = c(0.25, 0.5, 1, 2, 4)), length.out = num_strains)

covariate_mat <- matrix(data = sample(x = num_strains*num_covariates), nrow = num_strains)
genotype_mat <- matrix(data = rbinom(n = num_strains*num_snps, size = 1, prob = 0.3), nrow = num_strains, ncol = num_snps)
kinship_mat <- 1 - as.matrix(x = dist(x = genotype_mat, method = 'manhattan'))/num_snps

num_one_snp <- 1

A <- MASS::mvrnorm(n = 1,
                   # mu = rep(0, n),
                   mu = 1.2*genotype_mat[, num_one_snp],
                   Sigma = kinship_mat)
E <- rnorm(n = num_strains, sd = se_mean_per_strain)
phenotype <- A + E

locus_list <- lapply(X = as.data.frame(x = genotype_mat), FUN = as.matrix)

gs <- GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat)
wgs <- GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat, w = 1/se_mean_per_strain)


test_that(desc = 'Create a GenomeScan object',
          code = {

              # valid inputs
              expect_is(object = GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat),
                        class = 'GenomeScan')
              expect_is(object = GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list, K = kinship_mat, w = se_mean_per_strain),
                        class = 'GenomeScan')

              # one or more necessary inputs missing
              expect_error(object = GenomeScan$new())
              expect_error(object = GenomeScan$new(               X = covariate_mat, G = locus_list, K = kinship_mat))
              expect_error(object = GenomeScan$new(y = phenotype, X = covariate_mat, G = locus_list                 ))


              # right inputs, one with the wrong dimension
              expect_error(object = GenomeScan$new(y = phenotype[-1], X = covariate_mat,      G = locus_list,       K = kinship_mat,      w = se_mean_per_strain))
              expect_error(object = GenomeScan$new(y = phenotype,     X = covariate_mat[-1,], G = locus_list,       K = kinship_mat,      w = se_mean_per_strain))
              expect_error(object = GenomeScan$new(y = phenotype,     X = covariate_mat,      G = locus_list[[-1]], K = kinship_mat,      w = se_mean_per_strain))
              expect_error(object = GenomeScan$new(y = phenotype,     X = covariate_mat,      G = locus_list,       K = kinship_mat[-1,], w = se_mean_per_strain))
              expect_error(object = GenomeScan$new(y = phenotype,     X = covariate_mat,      G = locus_list,       K = kinship_mat,      w = se_mean_per_strain[-1]))

          })


test_that(desc = 'Prepare for a scan',
          code = {

              expect_is(object = gs$prep_scan(),  class = 'GenomeScan')
              expect_is(object = wgs$prep_scan(), class = 'GenomeScan')

          })


test_that(desc = 'Conduct a scan',
          code = {

              near_zero <- -1e-6

              a <- gs$prep_scan()$conduct_scan()
              expect_is(object = a,  class = 'GenomeScan')
              expect_true(object = all(a$Results$LR > near_zero))
              expect_true(object = all(a$Results$h2 > near_zero, a$Results$h2 < 1))

              b <-  wgs$prep_scan()$conduct_scan()
              expect_is(object = b, class = 'GenomeScan')
              expect_true(object = all(b$Results$LR > near_zero))
              expect_true(object = all(b$Results$h2 > near_zero, b$Results$h2 < 1))

          })
