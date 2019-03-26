library(pubh)


### Name: coef_plot
### Title: Plot of model coefficients.
### Aliases: coef_plot

### ** Examples

data(birthwt, package = "MASS")
birthwt$smoke <- factor(birthwt$smoke, labels=c("Non-smoker", "Smoker"))
birthwt$race <- factor(birthwt$race > 1, labels=c("White", "Non-white"))
model1 <- glm(bwt ~ smoke + race, data = birthwt)
glm_coef(model1, labels=c("Constant", "Smoker vs Non-smoker", "Non-white vs White"))
coef_plot(model1)



