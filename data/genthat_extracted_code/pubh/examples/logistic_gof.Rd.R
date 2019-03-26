library(pubh)


### Name: logistic_gof
### Title: Goodness of fit for Logistic Regression.
### Aliases: logistic_gof

### ** Examples

data(diet, package = "Epi")
model <- glm(chd ~ fibre, data = diet, family = binomial)
glm_coef(model, labels = c("Constant", "Fibre intake (g/day)"))
logistic_gof(model)



