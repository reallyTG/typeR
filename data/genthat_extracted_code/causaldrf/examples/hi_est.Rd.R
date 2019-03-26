library(causaldrf)


### Name: hi_est
### Title: The Hirano and Imbens estimator
### Aliases: hi_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

hi_list <- hi_est(Y = Y,
              treat = T,
              treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
              outcome_formula = Y ~ T + I(T^2) + gps + I(gps^2) + T * gps,
              data = example_data,
              grid_val = seq(8, 16, by = 1),
              treat_mod = "Normal")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "hi estimate")

lines(seq(8, 16, by = 1),
      hi_list$param,
      lty = 2,
      lwd = 2,
      col = "blue")

legend('bottomright',
        "hi estimate",
        lty=2,
        lwd = 2,
        col = "blue",
        bty='Y',
        cex=1)

rm(example_data, hi_list, sample_index)


## Example from van der Wal, Willem M., and Ronald B. Geskus. (2011)
#Simulate data with continuous confounder and outcome, binomial exposure.
#Marginal causal effect of exposure on outcome: 10.
n <- 1000
simdat <- data.frame(l = rnorm(n, 10, 5))
a.lin <- simdat$l - 10
pa <- exp(a.lin)/(1 + exp(a.lin))
simdat$a <- rbinom(n, 1, prob = pa)
simdat$y <- 10*simdat$a + 0.5*simdat$l + rnorm(n, -10, 5)
simdat[1:5,]
temp_hi <- hi_est(Y = y,
                 treat = a,
                 treat_formula = a ~ l,
                 outcome_formula = y ~ gps,
                 data = simdat,
                 grid_val = c(0, 1),
                 treat_mod = "Binomial",
                 link_function = "logit")

temp_hi[[1]]  # estimated coefficients



