library(CJAMP)


### Name: get_estimates_naive
### Title: Naive estimates of the copula and marginal parameters.
### Aliases: get_estimates_naive

### ** Examples

# Generate genetic data:
genodata <- generate_genodata(n_SNV = 20, n_ind = 1000)

# Generate phenotype data:
phenodata <- generate_phenodata_2_copula(genodata = genodata, MAF_cutoff = 1,
                                         prop_causal = 0.5, tau = 0.2,
                                         b1 = 0.3, b2 = 0.3)
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                         SNV = genodata$SNV1)

get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                    predictors_Y1 = predictors, predictors_Y2 = predictors,
                    copula_param = "both")




