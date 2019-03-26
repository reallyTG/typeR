library(ccmm)


### Name: ccmm-package
### Title: Causal Compositional Mediation Model
### Aliases: ccmm-package

### ** Examples

## Not run: 
##D # Load test data
##D data(ccmm_test_data);
##D head(ccmm_test_data);
##D outcome <- ccmm_test_data[,1];
##D treatment <- ccmm_test_data[,2];
##D mediators <- as.matrix(ccmm_test_data[,3:22]);
##D covariates <- as.matrix(ccmm_test_data[,23:24]);
##D 
##D # Run CCMM
##D rslt.ccmm <- ccmm(outcome, mediators, treatment, covariates);
##D 
##D # Sensitivity analysis
##D rslt.sa <- ccmm.sa(outcome, mediators, treatment, covariates);
##D plot(rslt.sa, type="l", xlab=expression(rho), ylab="TIDE")
##D abline(h=rslt.ccmm$TIDE, lty=2)
##D abline(h=0, lty=3)
##D cisa <- tide.ci.zero.rho(outcome, mediators, treatment, covariates)
##D csqs <- quantile(cisa, c(0.025, 0.975))
##D segments(0, csqs[1], 0, csqs[2])
## End(Not run)



