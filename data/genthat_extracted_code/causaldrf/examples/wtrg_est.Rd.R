library(causaldrf)


### Name: wtrg_est
### Title: The weighted regression estimator
### Aliases: wtrg_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data


t_mod_list <- t_mod(treat = T,
              treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
              data = example_data,
              treat_mod = "Normal")

cond_exp_data <- t_mod_list$T_data
full_data <- cbind(example_data, cond_exp_data)

wtrg_list <- wtrg_est(Y = Y,
                      treat = T,
                      covar_formula = ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                      data = example_data,
                      e_treat_1 = full_data$est_treat,
                      e_treat_2 = full_data$est_treat_sq,
                      e_treat_3 = full_data$est_treat_cube,
                      e_treat_4 = full_data$est_treat_quartic,
                      degree = 1)

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "weighted regression estimate")

abline(wtrg_list$param[1],
        wtrg_list$param[2],
        lty = 2,
        lwd = 2,
        col = "blue")

legend('bottomright',
        "weighted regression estimate",
        lty = 2,
        lwd = 2,
        col = "blue",
        bty='Y',
        cex=1)

rm(example_data, t_mod_list, cond_exp_data, full_data, wtrg_list, sample_index)



