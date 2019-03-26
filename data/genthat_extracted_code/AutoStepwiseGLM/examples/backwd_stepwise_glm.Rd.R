library(AutoStepwiseGLM)


### Name: backwd_stepwise_glm
### Title: Automated Backward Stepwise GLM
### Aliases: backwd_stepwise_glm

### ** Examples

dt <- mtcars
stepwise_model <- backwd_stepwise_glm(data = dt,
                                      dv = 'mpg',
                                      aic_wt = 1,
                                      r_wt = 0.8,
                                      mae_wt = 1,
                                      r_squ_wt = 0.8,
                                      train_prop = 0.6,
                                      random_seed = 5)
stepwise_model



