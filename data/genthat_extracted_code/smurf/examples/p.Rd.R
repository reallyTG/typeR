library(smurf)


### Name: p
### Title: Define Individual Subpenalties for a Multi-Type Regularized GLM
### Aliases: p

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
# 'year', 'rooms', 'quality' and 'size' with Fused Lasso penalties 
# where the reference category for 'year' is changed to 2000,
# 'warm' and 'central' are in one group for the Group Lasso penalty,
# 'tiles' and 'bathextra' are not regularized and 
# 'kitchen' has a Lasso penalty
formu <- rentm ~ p(area, pen = "gflasso") + 
  p(year, pen = "flasso", refcat = 2000) + p(rooms, pen = "flasso") + 
  p(quality, pen = "flasso") + p(size, pen = "flasso") +
  p(warm, pen = "grouplasso", group = 1) + p(central, pen = "grouplasso", group = 1) + 
  p(tiles, pen = "none") + bathextra + 
  p(kitchen, pen = "lasso")


# Fit a multi-type regularized GLM using the SMuRF algorithm.
# We use standardization adaptive penalty weights based on an initial GLM fit.
munich.fit <- glmsmurf(formula = formu, family = gaussian(), data = rent, 
                       pen.weights = "glm.stand", lambda = 0.1)

# Model summary
summary(munich.fit) 



