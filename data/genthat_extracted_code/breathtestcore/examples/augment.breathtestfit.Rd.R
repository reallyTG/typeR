library(breathtestcore)


### Name: augment.breathtestfit
### Title: Augmented prediction for breathtest fit
### Aliases: augment.breathtestfit

### ** Examples

library(broom)
# Generate simulated data
data = cleanup_data(simulate_breathtest_data(n_records = 3)$data)
# Fit using the curves individually
fit = nls_fit(data)
# Predict values at t=60 and t=120
augment(fit, minute = c(60, 120))




