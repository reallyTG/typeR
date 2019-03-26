library(CJAMP)


### Name: minusloglik
### Title: Minus log-likelihood of copula models.
### Aliases: minusloglik

### ** Examples

# Generate genetic data:
genodata <- generate_genodata(n_SNV = 20, n_ind = 1000)

# Generate phenotype data:
phenodata <- generate_phenodata_2_copula(genodata = genodata, MAF_cutoff = 1,
                                         prop_causal = 0.5, tau = 0.2,
                                         b1 = 0.3, b2 = 0.3)

# Example 1: Log-likelihood of null model without covariates & genetic effects
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = NULL, predictors_Y2 = NULL,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = NULL,
            predictors_Y2 = NULL, parameters = estimates, copula = "2param")

# Example 2: Log-likelihood of null model with covariates, without genetic effects
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors,
                                 predictors_Y2 = predictors,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors,
            predictors_Y2 = predictors, parameters = estimates, copula = "2param")

# Example 3: Log-likelihood of model with covariates & genetic effect on Y1 only
predictors_Y1 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                            SNV = genodata$SNV1)
predictors_Y2 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors_Y1,
                                 predictors_Y2 = predictors_Y2,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors_Y1,
            predictors_Y2 = predictors_Y2, parameters = estimates,
            copula = "2param")

# Example 4: Log-likelihood of model with covariates & genetic effect on Y2 only
predictors_Y1 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
predictors_Y2 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                            SNV = genodata$SNV1)
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors_Y1,
                                 predictors_Y2 = predictors_Y2,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors_Y1,
            predictors_Y2 = predictors_Y2, parameters = estimates,
            copula = "2param")

# Example 5: Log-likelihood of model without covariates, with genetic effects
predictors <- data.frame(SNV = genodata$SNV1)
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors,
                                 predictors_Y2 = predictors,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors,
            predictors_Y2 = predictors, parameters = estimates, copula = "2param")

# Example 6: Log-likelihood of model with covariates & genetic effects
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2, SNV = genodata$SNV1)
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors,
                                 predictors_Y2 = predictors,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors,
            predictors_Y2 = predictors, parameters = estimates, copula = "2param")

# Example 7: Log-likelihood of model with covariates & multiple genetic effects
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2, genodata[, 1:5])
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                 predictors_Y1 = predictors,
                                 predictors_Y2 = predictors,
                                 copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors,
            predictors_Y2 = predictors, parameters = estimates, copula = "2param")




