library(MachineShop)


### Name: tune
### Title: Model Tuning and Selection
### Aliases: tune tune.formula tune.ModelFrame tune.recipe

### ** Examples

## No test: 
## Survival response example
library(MASS)

fo <- medv ~ .

(gbmtune <- tune(fo, data = Boston, model = GBMModel,
                 grid = expand.grid(n.trees = c(25, 50, 100),
                                    interaction.depth = 1:3,
                                    n.minobsinnode = c(5, 10)),
                 control = CVControl(folds = 10, repeats = 5)))
summary(gbmtune)
plot(gbmtune, type = "line")

gbmfit <- fit(fo, data = Boston, model = gbmtune)
varimp(gbmfit)
## End(No test)




