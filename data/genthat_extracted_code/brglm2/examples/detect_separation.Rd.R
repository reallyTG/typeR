library(brglm2)


### Name: detect_separation
### Title: Method for 'glm' that tests for data separation and finds which
###   parameters have infinite maximum likelihood estimates in generalized
###   linear models with binomial responses
### Aliases: detect_separation detectSeparation print.detect_separation

### ** Examples


## endometrial data from Heinze \& Schemper (2002) (see ?endometrial)
data("endometrial", package = "brglm2")
endometrial_sep <- glm(HG ~ NV + PI + EH, data = endometrial,
                       family = binomial("logit"),
                       method = "detect_separation")
endometrial_sep
## The maximum likelihood estimate for NV is infinite
summary(update(endometrial_sep, method = "glm.fit"))

## Not run: 
##D ## Example inspired by unpublished microeconometrics lecture notes by
##D ## Achim Zeileis https://eeecon.uibk.ac.at/~zeileis/
##D ## The maximum likelihood estimate of sourhernyes is infinite
##D data("MurderRates", package = "AER")
##D murder_sep <- glm(I(executions > 0) ~ time + income +
##D                   noncauc + lfp + southern, data = MurderRates,
##D                   family = binomial(), method = "detect_separation")
##D murder_sep
##D ## which is also evident by the large estimated standard error for NV
##D murder_glm <- update(murder_sep, method = "glm.fit")
##D summary(murder_glm)
##D ## and is also reveal by the divergence of the NV column of the
##D ## result from the more computationally intensive check
##D check_infinite_estimates(murder_glm)
##D ## Mean bias reduction via adjusted scores results in finite estimates
##D update(murder_glm, method = "brglm_fit")
## End(Not run)



