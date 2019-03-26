library(DynNom)


### Name: DynNom
### Title: Dynamic Nomograms for Linear, Generalized Linear and
###   Proportional Hazards Models
### Aliases: DynNom
### Keywords: dynamic nomograms individual prediction shiny

### ** Examples

## Not run: 
##D # simple linear regression models
##D model1 <- lm(uptake ~ Plant + conc + Plant * conc, data = CO2)
##D DynNom(model1, CO2)
##D 
##D data1 <- data.frame(state.x77)
##D model2 <- ols(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad +
##D Frost + Area,data=data1)
##D DynNom(model2, data1)
##D 
##D # Generalized regression models
##D data2 =as.data.frame(Titanic)
##D model3 <- glm(Survived ~ Age + Class + Sex, data = data2, weights = Freq,
##D               family = binomial("probit"))
##D DynNom(model3, data2, clevel = 0.9)
##D 
##D model4 <- lrm(formula= vs ~ wt + disp, data = mtcars)
##D DynNom(model4, mtcars, clevel = 0.9, m.summary = "formatted")
##D 
##D counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
##D outcome <- gl(3, 1, 9)
##D treatment <- gl(3, 3)
##D data2 = data.frame(counts, outcome, treatment)
##D model5 <- Glm((2 * counts) ~ outcome + treatment, family = poisson(), data = data2)
##D DynNom.Glm(model5, data2)
##D 
##D # a proportional hazard model
##D data.kidney <- kidney
##D # always make sure that the categorical variables are in a factor class
##D data.kidney$sex <- as.factor(data.kidney$sex)
##D levels(data.kidney$sex) <- c("male", "female")
##D 
##D model6 <- coxph(Surv(time, status) ~ age + sex + disease, data.kidney)
##D DynNom(model6, data.kidney)
##D DynNom(model6, data.kidney, ptype = "1-st")
##D 
##D model7 <-cph((Surv(log(time), status)) ~ rcs(age, 4) * strat(trt) +
##D               diagtime * strat(prior) + lsp(karno, 60), data = veteran)
##D DynNom(model7, veteran)
## End(Not run)

if (interactive()) {
# a poisson regression model
model8 <- glm(event ~ mag + station + dist + accel, data = attenu, family = poisson)
DynNom(model8, attenu, covariate = "numeric")
}



