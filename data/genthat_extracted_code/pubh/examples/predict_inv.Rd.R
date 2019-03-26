library(pubh)


### Name: predict_inv
### Title: Given y solve for x in a simple linear model.
### Aliases: predict_inv

### ** Examples

## Spectrophotometry example. Titration curve for riboflavin (nmol/ml). The sample has an absorbance
## of 1.15. Aim is to estimate the concentration of riboflavin in the sample.

Riboflavin <- seq(0, 80, 10)
OD <- 0.0125 * Riboflavin + rnorm(9, 0.6, 0.03)
titration <- data.frame(Riboflavin, OD)

xyplot(OD ~ Riboflavin, data = titration, pch = 16, col = 1, aspect = 3/4) +
  layer(panel.smoother(lwd = 1.5, col = 2, method = "lm", ...))

## Model with intercept different from zero:
model <- lm(OD ~ Riboflavin, data = titration)
glm_coef(model)
predict_inv(model, 1.15)



