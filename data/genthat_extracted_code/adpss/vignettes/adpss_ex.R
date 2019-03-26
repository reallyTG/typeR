## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(adpss)
.cost0 <- c(1683.45766074111, 1555.0203968489900, 1545.2777876660502, 1528.3974722278008, 1471.7273013354791)

## ------------------------------------------------------------------------
# Working test: sequential probability ratio test (SPRT)
plot(1, 1, type="n", xlim=c(0, 25), ylim=c(0, 15), xlab="Fisher Inf.", ylab = "Score Stat.")
alpha <- 0.025
rho <- -log(0.65)
abline(-log(alpha) / rho, 1/2 * rho)

## ------------------------------------------------------------------------
# Final interim analysis
interim_analysis_4 <- adaptive_analysis_norm_local(
  overall_sig_level = 0.025,
  min_effect_size = -log(0.65),
  times = c(5.67, 9.18, 14.71, 20.02),
  stats = c(3.40, 4.35, 7.75, 11.11),
  final_analysis = FALSE
  )

## ------------------------------------------------------------------------
# Summary
print( with(interim_analysis_4, data.frame(analysis=0:par$analyses, time=par$times,
  intercept=char$intercept, stat=par$stats, boundary=char$boundary,
  pr_cond_err=char$cond_type_I_err, reject_H0=char$rej_H0)) )

## ------------------------------------------------------------------------
# Sample size calculation
sample_size_norm_local(
  overall_sig_level = 0.025,
  min_effect_size = -log(0.65),
  effect_size = 11.11 / 20.02, # needs not be MLE
  time = 20.02,
  target_power = 0.75,
  sample_size = TRUE
  )

## ------------------------------------------------------------------------
# Final analysis
final_analysis <- adaptive_analysis_norm_local(
  overall_sig_level = 0.025,
  min_effect_size = -log(0.65),
  times = c(5.67, 9.18, 14.71, 20.02, 24.44),
  stats = c(3.40, 4.35, 7.75, 11.11, 14.84),
  final_analysis = TRUE
  )

## ------------------------------------------------------------------------
# Summary
print( with(final_analysis, data.frame(analysis=0:par$analyses, time=par$times,
  intercept=char$intercept, stat=par$stats, boundary=char$boundary,
  pr_cond_err=char$cond_type_I_err, reject_H0=char$rej_H0)) )

## ---- eval=TRUE, echo=FALSE----------------------------------------------
init_work_test <- work_test_norm_global(min_effect_size = -log(0.65), cost_type_1_err = .cost0[1])

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  init_work_test <- work_test_norm_global(min_effect_size = -log(0.65), cost_type_1_err = 0)

## ---- echo=TRUE----------------------------------------------------------
with(init_work_test, plot(par$U_0, char$boundary, xlim=range(0, par$U_0),
  ylim=range(0, char$boundary[-1]), pch=16, cex=0.5) )

## ---- eval=TRUE, echo=FALSE----------------------------------------------
# Final interim analysis
interim_analysis_4 <- adaptive_analysis_norm_global(
  initial_test = init_work_test,
  times = c(5.67, 9.18, 14.71, 20.02),
  stats = c(3.40, 4.35, 7.75, 11.11),
  costs = .cost0[-1],
  final_analysis = FALSE,
  estimate = FALSE
  )

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  # Final interim analysis
#  interim_analysis_4 <- adaptive_analysis_norm_global(
#    initial_test = init_work_test,
#    times = c(5.67, 9.18, 14.71, 20.02),
#    stats = c(3.40, 4.35, 7.75, 11.11),
#    final_analysis = FALSE,
#    estimate = FALSE
#    )

## ------------------------------------------------------------------------
# Summary
print( with(interim_analysis_4, data.frame(analysis=0:par$analyses, time=par$times,
  cost=char$cost0, stat=par$stats, boundary=char$boundary, pr_cond_err=char$cond_type_I_err,
  reject_H0=char$rej_H0)) )

## ------------------------------------------------------------------------
# Sample size calculation
sample_size_norm_global(
  initial_test = init_work_test,
  effect_size = 11.11 / 20.02, # needs not be MLE
  time = 20.02,
  target_power = 0.75,
  sample_size = TRUE
  )

## ------------------------------------------------------------------------
# Final analysis
final_analysis <- adaptive_analysis_norm_global(
  initial_test = init_work_test,
  times = c(5.67, 9.18, 14.71, 20.02, 25.88),
  stats = c(3.40, 4.35, 7.75, 11.11, 14.84),
  costs = interim_analysis_4$char$cost0[-1], # Omited element is for time = 0
  final_analysis = TRUE,
  estimate = FALSE
  )
# Summary
print( with(final_analysis, data.frame(analysis=0:par$analyses, time=par$times,
  cost=char$cost0, stat=par$stats, boundary=char$boundary, pr_cond_err=char$cond_type_I_err,
  reject_H0=char$rej_H0)) )


## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  # Estimte (P-value, median unbiased estimate, and confidence limits)
#  print( final_analysis$est )

