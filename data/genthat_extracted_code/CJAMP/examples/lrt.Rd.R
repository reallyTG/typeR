library(CJAMP)


### Name: lrt
### Title: Compute likelihood ratio tests.
### Aliases: lrt lrt_copula lrt_param

### ** Examples


# Example 1: Test whether 2-parameter copula model has a better
#            model fit compared to Clayton copula (no).
genodata <- generate_genodata(n_SNV = 20, n_ind = 100)
phenodata <- generate_phenodata_2_copula(genodata = genodata$SNV1,
                                         MAF_cutoff = 1, prop_causal = 1,
                                         tau = 0.2, b1 = 0.3, b2 = 0.3)
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                         SNV = genodata$SNV1)
estimates_c <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors,
                                   predictors_Y2 = predictors,
                                   copula_param = "phi")
minusloglik_Clayton <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors,
                                   predictors_Y2 = predictors,
                                   parameters = estimates_c, copula = "Clayton")
estimates_2p <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                    predictors_Y1 = predictors,
                                    predictors_Y2 = predictors,
                                    copula_param = "both")
minusloglik_2param <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                  predictors_Y1 = predictors,
                                  predictors_Y2 = predictors,
                                  parameters = estimates_2p, copula = "2param")
lrt_copula(minusloglik_Clayton, minusloglik_2param)

# Example 2: Test marginal parameters (alternative model has better fit).
genodata <- generate_genodata(n_SNV = 20, n_ind = 100)
phenodata <- generate_phenodata_2_copula(genodata = genodata$SNV1,
                                         MAF_cutoff = 1, prop_causal = 1,
                                         tau = 0.2, b1 = 2, b2 = 2)
predictors_1 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
estimates_1 <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors_1,
                                   predictors_Y2 = predictors_1,
                                   copula_param = "phi")
minusloglik_1 <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                             predictors_Y1 = predictors_1,
                             predictors_Y2 = predictors_1,
                             parameters = estimates_1, copula = "Clayton")
predictors_2 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                           SNV = genodata$SNV1)
estimates_2 <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors_2,
                                   predictors_Y2 = predictors_2,
                                   copula_param = "phi")
minusloglik_2 <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                             predictors_Y1 = predictors_2,
                             predictors_Y2 = predictors_2,
                             parameters = estimates_2, copula = "Clayton")
lrt_param(minusloglik_1, minusloglik_2, df=2)




