library(bang)


### Name: sim_pred_hanova1
### Title: Simulate from a one-way hierarchical ANOVA posterior predictive
###   distribution
### Aliases: sim_pred_hanova1

### ** Examples

RCP26_2 <- temp2[temp2$RCP == "rcp26", ]
temp_res <- hanova1(resp = RCP26_2[, 1], fac = RCP26_2[, 2])
sim_pred <- sim_pred_hanova1(temp_res$theta_sim_vals, temp_res$sim_vals,
                             RCP26_2[, 2], 50)



