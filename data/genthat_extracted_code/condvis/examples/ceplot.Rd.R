library(condvis)


### Name: ceplot
### Title: Interactive conditional expectation plot
### Aliases: ceplot

### ** Examples

## Not run: 
##D ## Example 1: Multivariate regression, xs one continuous predictor
##D 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D 
##D library(mgcv)
##D model1 <- list(
##D     quadratic = lm(mpg ~ cyl + hp + wt + I(wt^2), data = mtcars),
##D     additive = mgcv::gam(mpg ~ cyl + hp + s(wt), data = mtcars))
##D 
##D conditionvars1 <- list(c("cyl", "hp"))
##D 
##D ceplot(data = mtcars, model = model1, response = "mpg", sectionvars = "wt",
##D   conditionvars = conditionvars1, threshold = 0.3, conf = T)
##D 
##D ## Example 2: Binary classification, xs one categorical predictor
##D 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$am <- as.factor(mtcars$am)
##D 
##D library(e1071)
##D model2 <- list(
##D   svm = svm(am ~ mpg + wt + cyl, data = mtcars, family = "binomial"),
##D   glm = glm(am ~ mpg + wt + cyl, data = mtcars, family = "binomial"))
##D 
##D ceplot(data = mtcars, model = model2, sectionvars = "wt", threshold = 1,
##D   type = "shiny")
##D 
##D ## Example 3: Multivariate regression, xs both continuous
##D 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$gear <- as.factor(mtcars$gear)
##D 
##D library(e1071)
##D model3 <- list(svm(mpg ~ wt + qsec + cyl + hp + gear,
##D   data = mtcars, family = "binomial"))
##D 
##D conditionvars3 <- list(c("cyl","gear"), "hp")
##D 
##D ceplot(data = mtcars, model = model3, sectionvars = c("wt", "qsec"),
##D   threshold = 1, conditionvars = conditionvars3)
##D 
##D ceplot(data = mtcars, model = model3, sectionvars = c("wt", "qsec"),
##D     threshold = 1, type = "separate", view3d = T)
##D 
##D ## Example 4: Multi-class classification, xs both categorical
##D 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$vs <- as.factor(mtcars$vs)
##D mtcars$am <- as.factor(mtcars$am)
##D mtcars$gear <- as.factor(mtcars$gear)
##D mtcars$carb <- as.factor(mtcars$carb)
##D 
##D library(e1071)
##D model4 <- list(svm(carb ~ ., data = mtcars, family = "binomial"))
##D 
##D ceplot(data = mtcars, model = model4, sectionvars = c("cyl", "gear"),
##D   threshold = 3)
##D 
##D ## Example 5: Multi-class classification, xs both continuous
##D 
##D data(wine)
##D wine$Class <- as.factor(wine$Class)
##D library(e1071)
##D 
##D model5 <- list(svm(Class ~ ., data = wine, probability = TRUE))
##D 
##D ceplot(data = wine, model = model5, sectionvars = c("Hue", "Flavanoids"),
##D   threshold = 3, probs = TRUE)
##D 
##D ceplot(data = wine, model = model5, sectionvars = c("Hue", "Flavanoids"),
##D   threshold = 3, type = "separate")
##D 
##D ceplot(data = wine, model = model5, sectionvars = c("Hue", "Flavanoids"),
##D   threshold = 3, type = "separate", selectortype = "pcp")
##D 
##D ## Example 6: Multi-class classification, xs with one categorical predictor,
##D ##            and one continuous predictor.
##D 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$carb <- as.factor(mtcars$carb)
##D 
##D library(e1071)
##D model6 <- list(svm(cyl ~ carb + wt + hp, data = mtcars, family = "binomial"))
##D 
##D ceplot(data = mtcars, model = model6, threshold = 1, sectionvars = c("carb",
##D   "wt"), conditionvars = "hp")
## End(Not run)




