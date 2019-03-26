library(ccmm)


### Name: ccmm
### Title: Causal Compositional Mediation Model
### Aliases: ccmm

### ** Examples

# Load test data
data(ccmm_test_data);
outcome <- ccmm_test_data[,1];
treatment <- ccmm_test_data[,2];
mediators <- as.matrix(ccmm_test_data[,3:22]);
covariates <- as.matrix(ccmm_test_data[,23:24]);

# Run CCMM
rslt.ccmm <- ccmm(outcome, mediators, treatment, covariates);



