library(CJAMP)


### Name: cjamp
### Title: C-JAMP: Copula-based joint analysis of multiple phenotypes.
### Aliases: cjamp cjamp_loop

### ** Examples


# Data generation
genodata <- generate_genodata(n_SNV = 20, n_ind = 100)
phenodata <- generate_phenodata_2_copula(genodata = genodata$SNV1,
                                         MAF_cutoff = 1, prop_causal = 1,
                                         tau = 0.2, b1 = 0.3, b2 = 0.3)

## Not run. When executing, the following takes about 2 minutes running time.
## Example 1: Analysis of multiple SNVs as predictors in one model
#predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
#                         genodata[, 1:3])
#cjamp(copula = "Clayton", Y1 = phenodata$Y1, Y2 = phenodata$Y2,
#      predictors_Y1 = predictors, predictors_Y2 = predictors,
#      optim_method = "BFGS", trace = 2, kkt2tol = 1E-16, SE_est = TRUE,
#      pval_est = TRUE, n_iter_max = 10)
#cjamp(copula = "2param", Y1 = phenodata$Y1, Y2 = phenodata$Y2,
#      predictors_Y1 = predictors, predictors_Y2 = predictors,
#      optim_method = "BFGS", trace = 2, kkt2tol = 1E-16, SE_est = TRUE,
#      pval_est = TRUE, n_iter_max = 10)
#
## Example 2: Analysis of multiple SNVs in separate models
#covariates <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
#predictors <- genodata
#cjamp_loop(copula = "Clayton", Y1 = phenodata$Y1, Y2 = phenodata$Y2,
#           predictors = predictors, covariates_Y1 = covariates,
#           covariates_Y2 = covariates, optim_method = "BFGS", trace = 2,
#           kkt2tol = 1E-16, SE_est = TRUE, pval_est = TRUE,
#           n_iter_max = 10)




