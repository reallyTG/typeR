library(tsensembler)


### Name: model_specs-class
### Title: Setup base learning models
### Aliases: model_specs-class
### Keywords: internal

### ** Examples

# A PPR model and a GLM model with default parameters
model_specs(learner = c("bm_ppr", "bm_glm"), learner_pars = NULL)


# A PPR model and a SVR model. The listed parameters are combined
# with a cartesian product.
# With these specifications an ensemble with 6 predictive base
# models will be created. Two PPR models, one with 2 nterms
# and another with 4; and 4 SVR models, combining the kernel
# and C parameters.
specs <- model_specs(
 c("bm_ppr", "bm_svr"),
 list(bm_ppr = list(nterms = c(2, 4)),
      bm_svr = list(kernel = c("vanilladot", "polydot"), C = c(1,5)))
)

# All parameters currently available (parameter values can differ)
model_specs(
 learner = c("bm_ppr", "bm_svr", "bm_randomforest",
             "bm_gaussianprocess", "bm_cubist", "bm_glm",
             "bm_gbm", "bm_pls_pcr", "bm_ffnn", "bm_mars"
         ),
 learner_pars = list(
    bm_ppr = list(
       nterms = c(2,4),
       sm.method = "supsmu"
     ),
    bm_svr = list(
       kernel = "rbfdot",
       C = c(1,5),
       epsilon = .01
     ),
    bm_glm = list(
       alpha = c(1, 0)
     ),
    bm_randomforest = list(
       num.trees = 500
     ),
    bm_gbm = list(
       interaction.depth = 1,
       shrinkage = c(.01, .005),
       n.trees = c(100)
     ),
    bm_mars = list(
       nk = 15,
       degree = 3,
       thresh = .001
     ),
    bm_ffnn = list(
       size = 30,
       decay = .01
     ),
    bm_pls_pcr = list(
       method = c("kernelpls", "simpls", "cppls")
     ),
    bm_gaussianprocess = list(
       kernel = "vanilladot",
       tol = .01
     ),
    bm_cubist = list(
       committees = 50,
       neighbors = 0
     )
  )
)




