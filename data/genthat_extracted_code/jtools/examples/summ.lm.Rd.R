library(jtools)


### Name: summ.lm
### Title: Linear regression summaries with options
### Aliases: summ.lm j_summ.lm

### ** Examples

# Create lm object
fit <- lm(Income ~ Frost + Illiteracy + Murder,
          data = as.data.frame(state.x77))

# Print the output with standardized coefficients and 3 digits
summ(fit, scale = TRUE, digits = 3)




