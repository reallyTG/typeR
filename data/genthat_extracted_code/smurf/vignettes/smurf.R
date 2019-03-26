## ----setup, include = FALSE----------------------------------------------
library("smurf")

## ------------------------------------------------------------------------
data("rent", package = "catdata")

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

## ---- eval = FALSE-------------------------------------------------------
#  rentm ~ p(area, pen = "gflasso") +
#          p(year, pen = "flasso", refcat = 2000) + p(rooms, pen = "flasso") +
#          p(quality, pen = "flasso") + p(size, pen = "flasso") +
#          p(warm, pen = "grouplasso", group = 1) + p(central, pen = "grouplasso", group = 1) +
#          p(tiles, pen = "none") + bathextra +
#          p(kitchen, pen = "lasso")

## ---- eval = FALSE-------------------------------------------------------
#  p(pred1, pred2, pen = "2dflasso")

## ------------------------------------------------------------------------
formu <- rentm ~ p(area, pen = "gflasso") + 
                 p(year, pen = "flasso") + p(rooms, pen = "flasso") + 
                 p(quality, pen = "flasso") + p(size, pen = "flasso") +
                 p(warm, pen = "lasso") + p(central, pen = "lasso") + 
                 p(tiles, pen = "lasso") + p(bathextra, pen = "lasso") + 
                 p(kitchen, pen = "lasso") 

## ---- warning = FALSE----------------------------------------------------
munich.fit <- glmsmurf(formula = formu, family = gaussian(), data = rent, 
                       pen.weights = "glm.stand", lambda = 0.008914)

## ---- warning = FALSE----------------------------------------------------
plot(munich.fit)
plot_reest(munich.fit)

## ------------------------------------------------------------------------
summary(munich.fit)

## ---- eval = FALSE-------------------------------------------------------
#  munich.fit.cv <- glmsmurf(formula = formu, family = gaussian(), data = rent,
#                            pen.weights = "glm.stand", lambda = "cv1se.dev",
#                            control = list(lambda.length = 25L))

## ---- eval = FALSE-------------------------------------------------------
#  munich.fit.cv$lambda

## ---- eval = FALSE-------------------------------------------------------
#  plot_lambda(munich.fit.cv)

## ----fig1, echo = FALSE, out.width = "545px"-----------------------------
knitr::include_graphics("Plot_lambda1.png")

## ---- eval = FALSE-------------------------------------------------------
#  # Zoomed plot
#  plot_lambda(munich.fit.cv, xlim = c(-8, -4), ylim = c(1550, 1750))

## ----fig2, echo = FALSE, out.width = "545px"-----------------------------
knitr::include_graphics("Plot_lambda2.png")

## ---- eval = FALSE-------------------------------------------------------
#  munich_adj <- matrix(0, 25, 25)
#  colnames(munich_adj) <- rownames(munich_adj) <- 1:25
#  munich_adj[1,  c(2, 3, 5, 12, 13)] <- 1
#  munich_adj[2,  c(1, 3, 5, 6, 8, 18)] <- 1
#  munich_adj[3,  c(1, 2, 4, 8, 9, 12)] <- 1
#  munich_adj[4,  c(3, 9, 11, 12)] <- 1
#  munich_adj[5,  c(1, 2, 13, 14, 16, 17, 18)] <- 1
#  munich_adj[6,  c(2, 7, 8, 18, 19)] <- 1
#  munich_adj[7,  c(6, 8, 19, 20, 25)] <- 1
#  munich_adj[8,  c(2, 3, 6, 7, 9, 25)] <- 1
#  munich_adj[9,  c(3, 4, 8, 10, 11, 21, 25)] <- 1
#  munich_adj[10, c(9, 11, 21, 23, 24)] <- 1
#  munich_adj[11, c(4, 9, 10, 12, 24)] <- 1
#  munich_adj[12, c(1, 3, 4, 11, 13)] <- 1
#  munich_adj[13, c(1, 5, 12, 14, 15)] <- 1
#  munich_adj[14, c(5, 13, 15, 16)] <- 1
#  munich_adj[15, c(13, 14, 16)] <- 1
#  munich_adj[16, c(5, 14, 15, 17)] <- 1
#  munich_adj[17, c(5, 16, 18)] <- 1
#  munich_adj[18, c(2, 5, 6, 17, 19)] <- 1
#  munich_adj[19, c(6, 7, 18, 20)] <- 1
#  munich_adj[20, c(7, 19, 21, 25)] <- 1
#  munich_adj[21, c(9, 10, 20, 22, 23, 25)] <- 1
#  munich_adj[22, c(21, 23)] <- 1
#  munich_adj[23, c(10, 21, 22, 24)] <- 1
#  munich_adj[24, c(10, 11, 23)] <- 1
#  munich_adj[25, c(7, 8, 9, 20, 21)] <- 1

## ---- eval = FALSE-------------------------------------------------------
#  formu2 <- rentm ~ p(area, pen = "ggflasso") +
#                    p(year, pen = "flasso") + p(size, pen = "flasso") +
#                    p(rooms, pen = "flasso") + p(quality, pen = "flasso") +
#                    p(warm, pen = "lasso") + p(central, pen = "lasso") +
#                    p(tiles, pen = "lasso") + p(bathextra, pen = "lasso") +
#                    p(kitchen, pen = "lasso")
#  
#  munich.fit2 <- glmsmurf(formula = formu2, family = gaussian(), data = rent,
#                          pen.weights = "glm.stand", lambda = 0.041787,
#                          adj.matrix = list(area = munich_adj))

