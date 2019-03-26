library(CJAMP)


### Name: summary.cjamp
### Title: Summary function.
### Aliases: summary.cjamp

### ** Examples

## Not run. When executing, the following takes about 2 minutes running time.
## Summary of regular cjamp function
#genodata <- generate_genodata(n_SNV = 20, n_ind = 100)
#phenodata <- generate_phenodata_2_copula(genodata = genodata$SNV1,
#                                         MAF_cutoff = 1, prop_causal = 1,
#                                         tau = 0.2, b1 = 0.3, b2 = 0.3)
#predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
#                        genodata[, 1:3])
#results <- cjamp(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
#                 predictors_Y1 = predictors, predictors_Y2 = predictors,
#                 copula = "2param", optim_method = "BFGS", trace = 2,
#                 kkt2tol = 1E-16, SE_est = TRUE, pval_est = TRUE,
#                 n_iter_max = 10)
#summary(results)
#
## Summary of looped cjamp function
#covariates <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
#predictors <- genodata
#results <- cjamp_loop(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
#                      covariates_Y1 = covariates,
#                      covariates_Y2 = covariates,
#                      predictors = predictors, copula = "Clayton",
#                      optim_method = "BFGS", trace = 2, kkt2tol = 1E-16,
#                      SE_est = TRUE, pval_est = TRUE, n_iter_max = 10)
#summary(results)




