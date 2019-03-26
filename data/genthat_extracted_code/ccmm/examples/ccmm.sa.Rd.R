library(ccmm)


### Name: ccmm.sa
### Title: Sensitivity analysis
### Aliases: ccmm.sa

### ** Examples

# Load test data
data(ccmm_test_data);
outcome <- ccmm_test_data[,1];
treatment <- ccmm_test_data[,2];
mediators <- as.matrix(ccmm_test_data[,3:22]);
covariates <- as.matrix(ccmm_test_data[,23:24]);

rslt.sa <- ccmm.sa(outcome, mediators, treatment, covariates);



