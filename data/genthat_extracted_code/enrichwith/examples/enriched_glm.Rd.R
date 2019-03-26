library(enrichwith)


### Name: enriched_glm
### Title: Fitting generalized linear models and enriching the result
### Aliases: enriched_glm

### ** Examples

## Not run: 
##D # A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
##D clotting <- data.frame(
##D    u = c(5,10,15,20,30,40,60,80,100, 5,10,15,20,30,40,60,80,100),
##D    time = c(118,58,42,35,27,25,21,19,18,69,35,26,21,18,16,13,12,12),
##D    lot = factor(c(rep(1, 9), rep(2, 9))))
##D 
##D # Fit a generalized linear model
##D cML <- enriched_glm(time ~ lot*log(u), data = clotting, family = Gamma("log"))
##D 
##D # Evaluate the densities at the data points in clotting at the
##D # maximum likelihood estimates
##D cML_dmodel <- get_dmodel_function(cML) # same as cML$auxiliary_functions$dmodel
##D cML_dmodel()
##D 
##D # Evaluate the densities at supplied data points
##D new_data <- data.frame(u = c(15:17, 15:17),
##D                        time = c(30:32, 15:17),
##D                        lot = factor(c(1, 1, 1, 2, 2, 2)))
##D cML_dmodel(data = new_data)
##D 
##D # Get pmodel and qmodel function
##D cML_pmodel <- get_pmodel_function(cML) # same as cML$auxiliary_functions$pmodel
##D cML_qmodel <- get_qmodel_function(cML) # same as cML$auxiliary_functions$qmodel
##D 
##D # The following should return c(30:32, 15:17)
##D probs <- cML_pmodel(data = new_data)
##D cML_qmodel(probs, data = new_data)
##D 
##D # Evaluate the observed information matrix at the MLE
##D cML_info <- get_information_function(cML)
##D cML_info(type = "observed")
##D 
##D # Wald tests based on the observed information at the
##D # moment based esimator of the dispersion
##D dispersion <- summary(cML)$dispersion
##D cML_vcov_observed <- solve(cML_info(dispersion = dispersion, type = "observed"))
##D lmtest::coeftest(cML, vcov = cML_vcov_observed)
##D 
##D # Wald tests based on the expected information at the
##D # moment based esimator of the dispersion
##D cML_vcov_expected <- solve(cML_info(dispersion = dispersion, type = "expected"))
##D lmtest::coeftest(cML, vcov = cML_vcov_expected)
##D # Same statistics as coef(summary(cML))[, "t value"]
##D 
## End(Not run)





