library(DynNom)


### Name: DNbuilder.lm
### Title: Shiny code for Dynamic Nomograms
### Aliases: DNbuilder.lm
### Keywords: dynamic nomograms linear models individual prediction shiny

### ** Examples

## Not run: 
##D # a linear regression model
##D model1 <- lm(Fertility ~ Agriculture + Education + Catholic , data = swiss)
##D DNbuilder.lm(model1, swiss)
##D 
##D model2 <- lm(uptake ~ Plant + conc + Plant * conc, data = CO2)
##D DNbuilder(model2, CO2)
## End(Not run)

if (interactive()) {
data1 <- data.frame(state.x77)
fit1 <- lm(formula = Life.Exp ~ ., data = data1)
DNbuilder(fit1, data1)
}



