library(DynNom)


### Name: DNbuilder.glm
### Title: Shiny code for Dynamic Nomograms
### Aliases: DNbuilder.glm
### Keywords: dynamic nomograms generalized linear models individual
###   prediction shiny

### ** Examples

## Not run: 
##D # a generilized linear model
##D model1 <- glm(Fertility ~ Agriculture + Education + Catholic, data = swiss)
##D DNbuilder.glm(model1, swiss, clevel = 0.9)
##D 
##D # a logistic regression model
##D data1 =as.data.frame(Titanic)
##D model2 <- glm(Survived ~ Age + Class + Sex, data = data1, weights = Freq,
##D               family = binomial("probit"))
##D DNbuilder(model2, as.data.frame(Titanic), clevel = 0.9)
## End(Not run)

if (interactive()) {
# a poisson regression model
model3 <- glm(event ~ mag + dist + accel, data = attenu, family = poisson)
DNbuilder(model3, attenu, covariate = "numeric")
}



