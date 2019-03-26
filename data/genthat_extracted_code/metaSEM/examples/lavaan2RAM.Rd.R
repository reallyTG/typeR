library(metaSEM)


### Name: lavaan2RAM
### Title: Convert 'lavaan' models to RAM models
### Aliases: lavaan2RAM
### Keywords: methods tssem

### ** Examples

## Regression model on correlation matrix
model1 <- "## y is modelled by x1, x2, and x3
           y ~ x1 + x2 + x3
           ## Fix the independent variables at 1
           x1 ~~ 1*x1
           x2 ~~ 1*x2
           x3 ~~ 1*x3
           ## Declare the correlations among the independent variables
           x1 ~~ x2
           x1 ~~ x3
           x2 ~~ x3"

## Compare the arrangements of variables with and without
## specifying the obs.variables arguments. 
lavaan2RAM(model1, obs.variables=c("y", "x1", "x2", "x3"))

## Two-factor CFA model
model2 <- "f1 =~ x1 + x2 + x3
           f2 =~ x4 + x5 + x6
           ## Declare the correlation between f1 and f2
           ## and label it with cor_f1f2
           f1 ~~ cor_f1f2*f2"

lavaan2RAM(model2)

## Regression model with the mean structure
model3 <- "y ~ x
           ## Intercept of y
           y ~ 1
           ## Mean of x
           x ~ 1"

lavaan2RAM(model3)



