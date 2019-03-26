library(DynNom)


### Name: DynNom.lm
### Title: Dynamic Nomograms for Linear Models
### Aliases: DynNom.lm
### Keywords: dynamic nomograms linear models individual prediction shiny

### ** Examples

## Not run: 
##D # a linear regression model
##D model1 <- lm(Fertility ~ Agriculture + Education + Catholic , data = swiss)
##D DynNom(model1, swiss)
##D 
##D model2 <- lm(uptake ~ Plant + conc + Plant * conc, data = CO2)
##D DynNom(model2, CO2)
## End(Not run)

if (interactive()) {
data1 <- data.frame(state.x77)
fit1 <- lm(formula = Life.Exp ~ ., data = data1)
DynNom(fit1, data1)
}



