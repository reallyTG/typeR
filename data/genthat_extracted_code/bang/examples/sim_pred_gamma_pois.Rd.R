library(bang)


### Name: sim_pred_gamma_pois
### Title: Simulate from a gamm-Poisson posterior predictive distribution
### Aliases: sim_pred_gamma_pois

### ** Examples

pump_res <- hef(model = "gamma_pois", data = pump)
pump_sim_pred <- sim_pred_gamma_pois(pump_res$theta_sim_vals, pump, 50)



