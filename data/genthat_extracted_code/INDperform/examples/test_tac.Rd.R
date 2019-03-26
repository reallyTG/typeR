library(INDperform)


### Name: test_tac
### Title: Compute (partial) autocorrelation functions and test for
###   significance
### Aliases: test_tac
### Keywords: internal

### ** Examples

# Using models of the Baltic Sea demo data:
# Get model residuals of GAMs
model_resid <- purrr::map(model_gam_ex$model,
  ~mgcv::residuals.gam(., type = "deviance"))
# test whether model residuals show significant TAC
test_tac(model_resid)

# Works also with GAMMs
model_resid <- purrr::map_if(model_gamm_ex$model,
  !is.na(model_gamm_ex$model),
  ~as.numeric(mgcv::residuals.gam(.$gam, type = "deviance")))
  # (exclude those GAMMs that were not fitted)
# test whether model residuals show significant TAC
test_tac(model_resid)$tac



