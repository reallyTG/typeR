library(causaldrf)


### Name: reg_est
### Title: The regression prediction estimator
### Aliases: reg_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

reg_list <- reg_est(Y = Y,
                    treat = T,
                    covar_formula = ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                    covar_lin_formula = ~ 1,
                    covar_sq_formula = ~ 1,
                    data = example_data,
                    degree = 1,
                    wt = NULL,
                    method = "same")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "regression estimate")

abline(reg_list$param[1],
        reg_list$param[2],
        lty = 2,
        col = "blue",
        lwd = 2)

legend('bottomright',
        "regression estimate",
        lty = 2,
        bty = 'Y',
        cex = 1,
        col = "blue",
        lwd = 2)

rm(example_data, reg_list, sample_index)



