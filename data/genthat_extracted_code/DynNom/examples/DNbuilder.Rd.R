library(DynNom)


### Name: DNbuilder
### Title: Shiny code for Dynamic Nomograms
### Aliases: DNbuilder
### Keywords: dynamic nomograms individual prediction shiny

### ** Examples

## Not run: 
##D # simple linear regression models
##D model1 <- lm(uptake ~ Plant + conc + Plant * conc, data = CO2)
##D DNbuilder(model1, CO2)
##D 
##D # Generalized regression models
##D data1 =as.data.frame(Titanic)
##D model2 <- glm(Survived ~ Age + Class + Sex, data = data1, weights = Freq,
##D               family = binomial("probit"))
##D DNbuilder(model2, data1, clevel = 0.9)
##D 
##D # a proportional hazard model
##D data.kidney <- kidney
##D # always make sure that the categorical variables are in a factor class
##D data.kidney$sex <- as.factor(data.kidney$sex)
##D levels(data.kidney$sex) <- c("male", "female")
##D 
##D model3 <- coxph(Surv(time, status) ~ age + sex + disease, data.kidney)
##D DNbuilder(model3, data.kidney)
##D DNbuilder(model3, data.kidney, ptype = "1-st")
## End(Not run)

if (interactive()) {
# a poisson regression model
model4 <- glm(event ~ mag + station + dist + accel, data = attenu, family = poisson)
DynNom(model4, attenu, covariate = "numeric")
}



