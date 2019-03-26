library(polywog)


### Name: plot.polywog
### Title: Univariate and bivariate fitted value plots
### Aliases: plot.polywog

### ** Examples

## Using occupational prestige data
data(Prestige, package = "carData")
Prestige <- transform(Prestige, income = income / 1000)

## Fit a polywog model with bootstrap iterations
## (note: using low convergence threshold to shorten computation time of the
## example, *not* recommended in practice!)
set.seed(22)
fit1 <- polywog(prestige ~ education + income + type,
                data = Prestige,
                degree = 2,
                boot = 5,
                thresh = 1e-4)

## All univariate relationships
plot(fit1, n = 20)

## Predicted prestige across occupational categories
plot(fit1, which = "type",
     control.plot = list(xlab = "occupational category"))

## Predicted prestige by education across occupational categories
plot(fit1, which = c("education", "type"), n = 20)

## Joint effect of education and income
plot(fit1, which = c("education", "income"), n = 10)

## Bring up interactive menu
## Not run: 
##D plot(fit1, ask = TRUE)
##D 
##D   # displays menu:
##D   # Select one or two variable numbers (separated by spaces), or 0 to exit:
##D 
##D   # 1: education
##D   # 2: income
##D   # 3: type
## End(Not run)



