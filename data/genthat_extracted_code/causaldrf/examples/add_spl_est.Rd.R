library(causaldrf)


### Name: add_spl_est
### Title: The additive spline estimator
### Aliases: add_spl_est

### ** Examples

## Example from Schafer (2015).
example_data <- sim_data
add_spl_list <- add_spl_est(Y = Y,
            treat = T,
            treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
            data = example_data,
            grid_val = seq(8, 16, by = 1),
            knot_num = 3,
            treat_mod = "Normal")


sample_index <- sample(1:1000, 100)
plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "additive spline estimate")

lines(seq(8, 16, by = 1),
      add_spl_list$param,
      lty = 2,
      lwd = 2,
      col = "blue")
legend('bottomright',
        "additive spline estimate",
        lty=2,
        lwd = 2,
        col = "blue",
        bty='Y', cex=1)

rm(example_data, add_spl_list, sample_index)

## See Vignette for more examples.



