library(breathtestcore)


### Name: tidy.breathtestfit
### Title: Broom-style tidying methods for breathtestfit
### Aliases: tidy.breathtestfit

### ** Examples

library(broom)
# Generate simulated data
data = cleanup_data(simulate_breathtest_data()$data)
# Fit with the population method
fit = nlme_fit(data)
# Output coefficients
tidy(fit)
# All coefficients in the long form
coef(fit)



