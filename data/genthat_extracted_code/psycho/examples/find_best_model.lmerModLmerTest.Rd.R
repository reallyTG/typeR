library(psycho)


### Name: find_best_model.lmerModLmerTest
### Title: Returns the best combination of predictors for lmerTest objects.
### Aliases: find_best_model.lmerModLmerTest

### ** Examples

## Not run: 
##D library(psycho)
##D library(lmerTest)
##D 
##D data <- standardize(iris)
##D fit <- lmerTest::lmer(Sepal.Length ~ Sepal.Width + Petal.Length + (1 | Species), data = data)
##D 
##D best <- find_best_model(fit)
##D best_formula <- best$formula
##D best$table
## End(Not run)




