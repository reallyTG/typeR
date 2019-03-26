library(causaldrf)


### Name: gam_est
### Title: The GAM estimator
### Aliases: gam_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

gam_list <- gam_est(Y = Y,
                treat = T,
                treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                data = example_data,
                grid_val = seq(8, 16, by = 1),
                treat_mod = "Normal")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "gam estimate")

lines(seq(8, 16, by = 1),
      gam_list$param,
      lty = 2,
      lwd = 2,
      col = "blue")

legend('bottomright',
        "gam estimate",
        lty=2,
        lwd = 2,
        col = "blue",
        bty='Y',
        cex=1)

rm(example_data, gam_list, sample_index)



