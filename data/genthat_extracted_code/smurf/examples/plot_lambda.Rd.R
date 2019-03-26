library(smurf)


### Name: plot_lambda
### Title: Plot Goodness-of-Fit Statistics or Information Criteria
### Aliases: plot_lambda plot_lambda.glmsmurf

### ** Examples

## Not run: 
##D   
##D # Munich rent data from catdata package
##D data("rent", package = "catdata")
##D 
##D # The considered predictors are the same as in 
##D # Gertheiss and Tutz (Ann. Appl. Stat., 2010).
##D # Response is monthly rent per square meter in Euro
##D 
##D # Urban district in Munich
##D rent$area <- as.factor(rent$area)
##D 
##D # Decade of construction
##D rent$year <- as.factor(floor(rent$year / 10) * 10)
##D 
##D # Number of rooms
##D rent$rooms <- as.factor(rent$rooms)
##D 
##D # Quality of the house with levels `fair`, `good` and `excellent`
##D rent$quality <- as.factor(rent$good + 2 * rent$best)
##D levels(rent$quality) <- c("fair", "good", "excellent")
##D 
##D # Floor space divided in categories (0, 30), [30, 40), ...,  [130, 140)
##D sizeClasses <- c(0, seq(30, 140, 10))
##D rent$size <- as.factor(sizeClasses[findInterval(rent$size, sizeClasses)])
##D 
##D # Is warm water present?
##D rent$warm <- factor(rent$warm, labels = c("yes", "no"))
##D 
##D # Is central heating present?
##D rent$central <- factor(rent$central, labels = c("yes", "no"))
##D 
##D # Does the bathroom have tiles?
##D rent$tiles <- factor(rent$tiles, labels = c("yes", "no"))
##D 
##D # Is there special furniture in the bathroom?
##D rent$bathextra <- factor(rent$bathextra, labels = c("no", "yes"))
##D 
##D # Is the kitchen well-equipped?
##D rent$kitchen <- factor(rent$kitchen, labels = c("no", "yes"))
##D 
##D 
##D 
##D # Create formula with 'rentm' as response variable,
##D # 'area' with a Generalized Fused Lasso penalty,
##D # 'year', 'rooms', 'quality' and 'size' with Fused Lasso penalties,
##D # and the other predictors with Lasso penalties.
##D formu <- rentm ~ p(area, pen = "gflasso") + 
##D   p(year, pen = "flasso") + p(rooms, pen = "flasso") + 
##D   p(quality, pen = "flasso") + p(size, pen = "flasso") +
##D   p(warm, pen = "lasso") + p(central, pen = "lasso") + 
##D   p(tiles, pen = "lasso") + p(bathextra, pen = "lasso") + 
##D   p(kitchen, pen = "lasso") 
##D 
##D # Fit a multi-type regularized GLM using the SMuRF algorithm and select the optimal value of lambda 
##D # using cross-validation (with the deviance as loss measure and the one standard error rule).
##D # We use standardization adaptive penalty weights based on an initial GLM fit.
##D # The number of values of lambda to consider in cross-validation is
##D # set to 25 using the control argument (default is 50).
##D munich.fit.cv <- glmsmurf(formula = formu, family = gaussian(), data = rent, 
##D                           pen.weights = "glm.stand", lambda = "cv1se.dev",
##D                           control = list(lambda.length = 25L))
##D 
##D 
##D # Plot average deviance over cross-validation folds as a function of the logarithm of lambda
##D plot_lambda(munich.fit.cv)
##D # Zoomed plot
##D plot_lambda(munich.fit.cv, xlim = c(-8, -4), ylim = c(1550, 1750))
## End(Not run)



