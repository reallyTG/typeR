library(bang)


### Name: sim_pred_beta_binom
### Title: Simulate from a beta-binomial posterior predictive distribution
### Aliases: sim_pred_beta_binom

### ** Examples

rat_res <- hef(model = "beta_binom", data = rat)
rat_sim_pred <- sim_pred_beta_binom(rat_res$theta_sim_vals, rat, 50)



