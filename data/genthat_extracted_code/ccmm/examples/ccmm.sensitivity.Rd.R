library(ccmm)


### Name: ccmm.sensitivity
### Title: Sensitivity analysis
### Aliases: ccmm.sensitivity

### ** Examples

# Load test data
data(ccmm_test_data);
outcome <- ccmm_test_data[,1];
treatment <- ccmm_test_data[,2];
mediators <- as.matrix(ccmm_test_data[,3:22]);
covariates <- as.matrix(ccmm_test_data[,23:24]);

ccmm.sensitivity(rh=0, outcome, mediators, treatment, covariates);



