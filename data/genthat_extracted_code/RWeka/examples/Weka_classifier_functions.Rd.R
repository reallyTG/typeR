library(RWeka)


### Name: Weka_classifier_functions
### Title: R/Weka Classifier Functions
### Aliases: Weka_classifier_functions LinearRegression Logistic SMO
### Keywords: models regression classif

### ** Examples

## Linear regression:
## Using standard data set 'mtcars'.
LinearRegression(mpg ~ ., data = mtcars)
## Compare to R:
step(lm(mpg ~ ., data = mtcars), trace = 0)

## Using standard data set 'chickwts'.
LinearRegression(weight ~ feed, data = chickwts)
## (Note the interactions!)

## Logistic regression:
## Using standard data set 'infert'.
STATUS <- factor(infert$case, labels = c("control", "case"))
Logistic(STATUS ~ spontaneous + induced, data = infert)
## Compare to R:
glm(STATUS ~ spontaneous + induced, data = infert, family = binomial())

## Sequential minimal optimization algorithm for training a support
## vector classifier, using am RBF kernel with a non-default gamma
## parameter (argument '-G') instead of the default polynomial kernel
## (from a question on r-help):
SMO(Species ~ ., data = iris,
    control = Weka_control(K =
    list("weka.classifiers.functions.supportVector.RBFKernel", G = 2)))
## In fact, by some hidden magic it also "works" to give the "base" name
## of the Weka kernel class:
SMO(Species ~ ., data = iris,
    control = Weka_control(K = list("RBFKernel", G = 2)))



