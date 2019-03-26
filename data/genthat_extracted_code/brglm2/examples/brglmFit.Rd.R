library(brglm2)


### Name: brglmFit
### Title: Fitting function for 'glm' for reduced-bias estimation and
###   inference
### Aliases: brglmFit brglm_fit

### ** Examples

## The lizards example from ?brglm::brglm
data("lizards")
# Fit the model using maximum likelihood
lizardsML <- glm(cbind(grahami, opalinus) ~ height + diameter +
                 light + time, family = binomial(logit), data = lizards,
                 method = "glm.fit")
# Mean bias-reduced fit:
lizardsBR_mean <- glm(cbind(grahami, opalinus) ~ height + diameter +
                      light + time, family = binomial(logit), data = lizards,
                      method = "brglmFit")
# Median bias-reduced fit:
lizardsBR_median <- glm(cbind(grahami, opalinus) ~ height + diameter +
                        light + time, family = binomial(logit), data = lizards,
                        method = "brglmFit", type = "AS_median")
summary(lizardsML)
summary(lizardsBR_median)
summary(lizardsBR_mean)


## Another example from
## King, Gary, James E. Alt, Nancy Elizabeth Burns and Michael Laver
## (1990).  "A Unified Model of Cabinet Dissolution in Parliamentary
## Democracies", _American Journal of Political Science_, **34**, 846-870

## Not run: 
##D data("coalition", package = "brglm2")
##D # The maximum likelihood fit with log link
##D coalitionML <- glm(duration ~ fract + numst2, family = Gamma, data = coalition)
##D # The mean bias-reduced fit
##D coalitionBR_mean <- update(coalitionML, method = "brglmFit")
##D # The bias-corrected fit
##D coalitionBC <- update(coalitionML, method = "brglmFit", type = "correction")
##D # The median bias-corrected fit
##D coalitionBR_median <- update(coalitionML, method = "brglmFit", type = "AS_median")
## End(Not run)

## Not run: 
##D ## An example with offsets from Venables & Ripley (2002, p.189)
##D data("anorexia", package = "MASS")
##D 
##D anorexML <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
##D                 family = gaussian, data = anorexia)
##D anorexBC <- update(anorexML, method = "brglmFit", type = "correction")
##D anorexBR_mean <- update(anorexML, method = "brglmFit")
##D anorexBR_median <- update(anorexML, method = "brglmFit", type = "AS_median")
##D 
##D ## All methods return the same estimates for the regression
##D ## parameters because the maximum likelihood estimator is normally
##D ## distributed around the `true` value under the model (hence, both
##D ## mean and component-wise median unbiased). The Wald tests for
##D ## anorexBC and anorexBR_mean differ from anorexML
##D ## because the bias-reduced estimator of the dispersion is the
##D ## unbiased, by degree of freedom adjustment (divide by n - p),
##D ## estimator of the residual variance. The Wald tests from
##D ## anorexBR_median are based on the median bias-reduced estimator
##D ## of the dispersion that results from a different adjustment of the
##D ## degrees of freedom (divide by n - p - 2/3)
##D summary(anorexML)
##D summary(anorexBC)
##D summary(anorexBR_mean)
##D summary(anorexBR_median)
## End(Not run)

## endometrial data from Heinze \& Schemper (2002) (see ?endometrial)
data("endometrial", package = "brglm2")
endometrialML <- glm(HG ~ NV + PI + EH, data = endometrial,
                     family = binomial("probit"))
endometrialBR_mean <- update(endometrialML, method = "brglmFit",
                             type = "AS_mean")
endometrialBC <- update(endometrialML, method = "brglmFit",
                        type = "correction")
endometrialBR_median <- update(endometrialML, method = "brglmFit",
                               type = "AS_median")
summary(endometrialML)
summary(endometrialBC)
summary(endometrialBR_mean)
summary(endometrialBR_median)




