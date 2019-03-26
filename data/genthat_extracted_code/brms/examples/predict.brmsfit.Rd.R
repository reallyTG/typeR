library(brms)


### Name: predict.brmsfit
### Title: Model Predictions of 'brmsfit' Objects
### Aliases: predict.brmsfit posterior_predict.brmsfit posterior_predict

### ** Examples

## Not run: 
##D ## fit a model
##D fit <- brm(time | cens(censored) ~ age + sex + (1+age||patient), 
##D            data = kidney, family = "exponential", inits = "0")
##D 
##D ## predicted responses
##D pp <- predict(fit)
##D head(pp)
##D 
##D ## predicted responses excluding the group-level effect of age
##D pp2 <- predict(fit, re_formula = ~ (1|patient))
##D head(pp2)
##D 
##D ## predicted responses of patient 1 for new data
##D newdata <- data.frame(sex = factor(c("male", "female")),
##D                       age = c(20, 50),
##D                       patient = c(1, 1))
##D predict(fit, newdata = newdata)
## End(Not run)




