library(jtools)


### Name: export_summs
### Title: Export regression summaries to tables
### Aliases: export_summs

### ** Examples

states <- as.data.frame(state.x77)
fit1 <- lm(Income ~ Frost, data = states)
fit2 <- lm(Income ~ Frost + Illiteracy, data = states)
fit3 <- lm(Income ~ Frost + Illiteracy + Murder, data = states)

if (requireNamespace("huxtable")) {
  # Export all 3 regressions with "Model #" labels,
  # standardized coefficients, and robust standard errors
  export_summs(fit1, fit2, fit3,
               model.names = c("Model 1","Model 2","Model 3"),
               coefs = c("Frost Days" = "Frost",
                         "% Illiterate" = "Illiteracy",
                         "Murder Rate" = "Murder"),
               scale = TRUE, robust = TRUE)
}




