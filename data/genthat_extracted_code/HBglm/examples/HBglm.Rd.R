library(HBglm)


### Name: HBglm
### Title: Hierarchical Bayesian Regression for GLMs
### Aliases: HBglm hbglm hbglm.sampler.control hbglm.model.control
###   print.hbglm predict.hbglm coef.hbglm summary.hbglm
###   print.summary.hbglm
### Keywords: Hierarchical, Bayesian, regression, multilevel

### ** Examples

  library(HBglm)
  data("linear_list", package = "HBglm")
  fm <- formula(y ~ x1 + x2 + x3 - 1 | z1 + z2 + z3 - 1 | grpID)
  fm.fixed <- formula(y ~ f1 + f2)
  samp.control = hbglm.sampler.control(num.samples = 20)
  ## Not run: 
##D     fit <- hbglm(fm, linear_list, formula.fixed = fm.fixed, family="gaussian",
##D                 sampler.control = samp.control, print.level=0)
##D     print(fit)
##D   
## End(Not run)



