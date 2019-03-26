library(causaldrf)


### Name: prop_spline_est
### Title: The propensity-spline prediction estimator
### Aliases: prop_spline_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

t_mod_list <- t_mod(treat = T,
              treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
              data = example_data,
              treat_mod = "Normal")

cond_exp_data <- t_mod_list$T_data
full_data <- cbind(example_data, cond_exp_data)

prop_spline_list <- prop_spline_est(Y = Y,
                            treat = T,
                            covar_formula = ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                            covar_lin_formula = ~ 1,
                            covar_sq_formula = ~ 1,
                            data = example_data,
                            e_treat_1 = full_data$est_treat,
                            degree = 1,
                            wt = NULL,
                            method = "different",
                            spline_df = 5,
                            spline_const = 4,
                            spline_linear = 4,
                            spline_quad = 4)

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "propensity spline estimate")

abline(prop_spline_list$param[1],
        prop_spline_list$param[2],
        lty = 2,
        col = "blue",
        lwd = 2)

legend('bottomright',
        "propensity spline estimate",
        lty = 2,
        bty = 'Y',
        cex = 1,
        col = "blue",
        lwd = 2)

rm(example_data, prop_spline_list, sample_index)



