
# Run fitting procedure on Munich rent example

# Munich rent data from catdata package
data("rent", package = "catdata", envir = environment())

# Urban district in Munich
rent$area <- as.factor(rent$area)
# Decade of construction
rent$year <- as.factor(floor(rent$year / 10) * 10)
# Number of rooms
rent$rooms <- as.factor(rent$rooms)
# Quality
rent$quality <- as.factor(rent$good + 2 * rent$best)
levels(rent$quality) <- c("fair", "good", "excellent")
# Floor space, in categories
sizeClasses <- c(0, seq(30, 140, 10))
rent$size <- as.factor(sizeClasses[findInterval(rent$size, sizeClasses)])
# Warm water present
rent$warm <- factor(rent$warm, labels = c("yes", "no"))
# Central heating present
rent$central <- factor(rent$central, labels = c("yes", "no"))
# Bathroom with tiles
rent$tiles <- factor(rent$tiles, labels = c("yes", "no"))
# Special furniture in bathroom
rent$bathextra <- factor(rent$bathextra, labels = c("no", "yes"))
# Well-equipped kitchen
rent$kitchen <- factor(rent$kitchen, labels = c("no", "yes"))


# Create formula with 'rentm' as response variable,
# 'area' with a Generalized Fused Lasso penalty,
# 'year', 'rooms', 'quality' and 'size' with Fused Lasso penalties,
# and the other predictors with Lasso penalties.
formu <- rentm ~ p(area, pen = "gflasso", refcat = 3) +
  p(year, pen = "flasso") + p(rooms, pen = "flasso") +
  p(quality, pen = "flasso") + p(size, pen = "flasso") +
  p(warm, pen = "lasso") + p(central, pen = "lasso") +
  p(tiles, pen = "lasso") + p(bathextra, pen = "lasso") +
  p(kitchen, pen = "lasso")


# Fit a multi-type regularized GLM using the SMuRF algorithm.
# We use adaptive standardization penalty weights based on a GLM fit.
# The value for lambda is selected using cross-validation
# (with MSE as measure), see example(plot_lambda)
munich.fit <- glmsmurf(formu, family = gaussian(), data = rent,
                       pen.weights = "glm.stand", lambda = 0.008914, 
                       control = list(eps = 1e-5), x.return = TRUE)

# No re-estimation
munich.fit2 <- glmsmurf(formu, family = gaussian(), data = rent,
                        pen.weights = "glm.stand", lambda = 0.008914, 
                        control = list(reest = FALSE, eps = 1e-5))


# With 2D effect
formu3 <- update(formu, "~ . + p(quality, bathextra, pen = \"2dflasso\")")
munich.fit3 <- glmsmurf(formu3, family = gaussian(), data = rent,
                        pen.weights = "glm.stand", lambda = 0.008914, 
                        control = list(eps = 1e-5), x.return = TRUE)


# Selection of lambda (IS)
munich.fit.is <- suppressWarnings(glmsmurf(formu, family = gaussian(), data = rent,
                                           pen.weights = "glm.stand", lambda = "is.aic", 
                                           control = list(eps = 1e-5, lambda.length = 3L, lambda.max = 1)))

# Selection of lambda (OOS)
munich.fit.oos <- suppressWarnings(glmsmurf(formu, family = gaussian(), data = rent,
                                            pen.weights = "glm.stand", lambda = "oos.dev", 
                                            control = list(eps = 1e-5, lambda.length = 3L, lambda.min = 0.1)))

# Selection of lambda (CV)
munich.fit.cv <- suppressWarnings(glmsmurf(formu, family = gaussian(), data = rent,
                                           pen.weights = "glm.stand", lambda = "cv.mse", 
                                           control = list(eps = 1e-5, lambda.length = 3L, k = 2L, ncores = 1L)))

# Selection of lambda (CV with 1SE rule)
munich.fit.cv1se <- suppressWarnings(glmsmurf(formu, family = gaussian(), data = rent,
                                              pen.weights = "glm.stand", lambda = "cv1se.mse", 
                                              control = list(eps = 1e-5, lambda.length = 3L, k = 2L, ncores = 1L)))


# Compute adjacency matrix for Munich
munich_adj <- matrix(0, 25, 25)
colnames(munich_adj) <- rownames(munich_adj) <- 1:25
munich_adj[1, c(2, 3, 5, 12, 13)] <- 1
munich_adj[2, c(1, 3, 5, 6, 8, 18)] <- 1
munich_adj[3, c(1, 2, 4, 8, 9, 12)] <- 1
munich_adj[4, c(3, 9, 11, 12)] <- 1
munich_adj[5, c(1, 2, 13, 14, 16, 17, 18)] <- 1
munich_adj[6, c(2, 7, 8, 18, 19)] <- 1
munich_adj[7, c(6, 8, 19, 20, 25)] <- 1
munich_adj[8, c(2, 3, 6, 7, 9, 25)] <- 1
munich_adj[9, c(3, 4, 8, 10, 11, 21, 25)] <- 1
munich_adj[10, c(9, 11, 21, 23, 24)] <- 1
munich_adj[11, c(4, 9, 10, 12, 24)] <- 1
munich_adj[12, c(1, 3, 4, 11, 13)] <- 1
munich_adj[13, c(1, 5, 12, 14, 15)] <- 1
munich_adj[14, c(5, 13, 15, 16)] <- 1
munich_adj[15, c(13, 14, 16)] <- 1
munich_adj[16, c(5, 14, 15, 17)] <- 1
munich_adj[17, c(5, 16, 18)] <- 1
munich_adj[18, c(2, 5, 6, 17, 19)] <- 1
munich_adj[19, c(6, 7, 18, 20)] <- 1
munich_adj[20, c(7, 19, 21, 25)] <- 1
munich_adj[21, c(9, 10, 20, 22, 23, 25)] <- 1
munich_adj[22, c(21, 23)] <- 1
munich_adj[23, c(10, 21, 22, 24)] <- 1
munich_adj[24, c(10, 11, 23)] <- 1
munich_adj[25, c(7, 8, 9, 20, 21)] <- 1

munich_adj_orig <- munich_adj