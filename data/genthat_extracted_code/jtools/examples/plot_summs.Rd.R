library(jtools)


### Name: plot_summs
### Title: Plot Regression Summaries
### Aliases: plot_summs plot_coefs

### ** Examples

states <- as.data.frame(state.x77)
fit1 <- lm(Income ~ Frost + Illiteracy + Murder +
           Population + Area + `Life Exp` + `HS Grad`,
           data = states, weights = runif(50, 0.1, 3))
fit2 <- lm(Income ~ Frost + Illiteracy + Murder +
           Population + Area + `Life Exp` + `HS Grad`,
           data = states, weights = runif(50, 0.1, 3))
fit3 <- lm(Income ~ Frost + Illiteracy + Murder +
           Population + Area + `Life Exp` + `HS Grad`,
           data = states, weights = runif(50, 0.1, 3))

# Plot all 3 regressions with custom predictor labels,
# standardized coefficients, and robust standard errors
plot_summs(fit1, fit2, fit3,
           coefs = c("Frost Days" = "Frost", "% Illiterate" = "Illiteracy",
                     "Murder Rate" = "Murder"),
           scale = TRUE, robust = TRUE)




