library(causaldrf)


### Name: nw_est
### Title: The Nadaraya-Watson modified estimator
### Aliases: nw_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

nw_list <- nw_est(Y = Y,
                treat = T,
                treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                data = example_data,
                grid_val = seq(8, 16, by = 1),
                bandw = bw.SJ(example_data$T),
                treat_mod = "Normal")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "nw estimate")

lines(seq(8, 16, by = 1),
      nw_list$param,
      lty = 2,
      lwd = 2,
      col = "blue")

legend('bottomright',
        "nw estimate",
        lty=2,
        lwd = 2,
        col = "blue",
        bty='Y',
        cex=1)

rm(example_data, nw_list, sample_index)



