library(ccmm)


### Name: tide.ci.zero.rho
### Title: Bootstrap samples of TIDE with zero correlation
### Aliases: tide.ci.zero.rho

### ** Examples

# Load test data
data(ccmm_test_data);
outcome <- ccmm_test_data[,1];
treatment <- ccmm_test_data[,2];
mediators <- as.matrix(ccmm_test_data[,3:22]);
covariates <- as.matrix(ccmm_test_data[,23:24]);

cisa <- tide.ci.zero.rho(outcome, mediators, treatment, covariates, n.boot=200)



