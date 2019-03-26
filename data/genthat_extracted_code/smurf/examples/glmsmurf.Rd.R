library(smurf)


### Name: glmsmurf
### Title: Fit a Multi-Type Regularized GLM Using the SMuRF Algorithm
### Aliases: glmsmurf glmsmurf.fit

### ** Examples

# Munich rent data from catdata package
data("rent", package = "catdata")

# The considered predictors are the same as in 
# Gertheiss and Tutz (Ann. Appl. Stat., 2010).
# Response is monthly rent per square meter in Euro

# Urban district in Munich
rent$area <- as.factor(rent$area)

# Decade of construction
rent$year <- as.factor(floor(rent$year / 10) * 10)

# Number of rooms
rent$rooms <- as.factor(rent$rooms)

# Quality of the house with levels `fair`, `good` and `excellent`
rent$quality <- as.factor(rent$good + 2 * rent$best)
levels(rent$quality) <- c("fair", "good", "excellent")

# Floor space divided in categories (0, 30), [30, 40), ...,  [130, 140)
sizeClasses <- c(0, seq(30, 140, 10))
rent$size <- as.factor(sizeClasses[findInterval(rent$size, sizeClasses)])

# Is warm water present?
rent$warm <- factor(rent$warm, labels = c("yes", "no"))

# Is central heating present?
rent$central <- factor(rent$central, labels = c("yes", "no"))

# Does the bathroom have tiles?
rent$tiles <- factor(rent$tiles, labels = c("yes", "no"))

# Is there special furniture in the bathroom?
rent$bathextra <- factor(rent$bathextra, labels = c("no", "yes"))

# Is the kitchen well-equipped?
rent$kitchen <- factor(rent$kitchen, labels = c("no", "yes"))



# Create formula with 'rentm' as response variable,
# 'area' with a Generalized Fused Lasso penalty,
# 'year', 'rooms', 'quality' and 'size' with Fused Lasso penalties,
# and the other predictors with Lasso penalties.
formu <- rentm ~ p(area, pen = "gflasso") + 
 p(year, pen = "flasso") + p(rooms, pen = "flasso") + 
 p(quality, pen = "flasso") + p(size, pen = "flasso") +
 p(warm, pen = "lasso") + p(central, pen = "lasso") + 
 p(tiles, pen = "lasso") + p(bathextra, pen = "lasso") + 
 p(kitchen, pen = "lasso") 


# Fit a multi-type regularized GLM using the SMuRF algorithm.
# We use standardization adaptive penalty weights based on an initial GLM fit.
# The value for lambda is selected using cross-validation 
# (with the deviance as loss measure and the one standard error rule), see example(plot_lambda) 
munich.fit <- glmsmurf(formula = formu, family = gaussian(), data = rent, 
                       pen.weights = "glm.stand", lambda = 0.008914)


####
# S3 methods for glmsmurf objects


# Model summary
summary(munich.fit) 


# Get coefficients of estimated model
coef(munich.fit) 
# Get coefficients of re-estimated model
coef_reest(munich.fit)
 

# Plot coefficients of estimated model
plot(munich.fit)
# Plot coefficients of re-estimated model
plot_reest(munich.fit)


# Get deviance of estimated model
deviance(munich.fit) 
# Get deviance of re-estimated model
deviance_reest(munich.fit)


# Get fitted values of estimated model
fitted(munich.fit) 
# Get fitted values of re-estimated model
fitted_reest(munich.fit)


# Get predicted values of estimated model on scale of linear predictors
predict(munich.fit, type = "link") 
# Get predicted values of re-estimated model on scale of linear predictors
predict_reest(munich.fit, type = "link")


# Get deviance residuals of estimated model
residuals(munich.fit, type = "deviance") 
# Get deviance residuals of re-estimated model
residuals_reest(munich.fit, type = "deviance")



