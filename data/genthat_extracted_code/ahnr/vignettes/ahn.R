## ----Example_1_Training, fig.width=7, fig.asp = .62----------------------
library(ahnr)

# Create data
set.seed(123)
x <- 2 * runif(1000) - 1;
x <- sort(x)

y <- (x < 0.1) * (0.05 * runif(1000) + atan(pi*x)) + 
    (x >= 0.1 & x < 0.6) * (0.05 * runif(1000) + sin(pi*x)) + 
    (x >= 0.6) * (0.05 * runif(1000) + cos(pi*x))

plot(x, y, type = 'l')

# Create the Sigma dataset
Sigma <- list(X = data.frame(x = x), Y = data.frame(y = y))

# Create network
ahn <- fit(Sigma, 4, 0.01, 2000)

## ----Example_1_Simulation, fig.width=7, fig.asp = .62--------------------
# Create test data
X <- data.frame(x = x)

# Simulate
ysim <- predict(ahn, X)

plot(x, y, type = 'l')
lines(x, ysim, type = 'l', lty = 2, col = 'red')
legend(-1, 1, c('Original', 'Simulation'), col = c(1,2), lty = c(1,2), cex = 0.8)

## ----Example_1_Summary---------------------------------------------------
summary(ahn)

## ----Example_1_Network_Visualization-------------------------------------
visualize(ahn)

## ----Example_2_Training_and_Simulation, fig.width=7, fig.asp = .62-------
# Create data
set.seed(12321)
t <- seq(0, 15, 0.01)
X <- data.frame(x1 = cos(t), x2 = t)
Y <- data.frame(y = sin(t))

# Create the Sigma dataset
Sigma <- list(X = X, Y = Y)

# Create network
ahn <- fit(Sigma, 5, 0.01, 2000)

# Simulate
ysim <- predict(ahn, X)

plot(t, Y$y, type = 'l', col = 'black', xlab = 't', ylab = 'y')
lines(t, ysim, type = 'l', lty = 2, col = 'red')
legend(0, -0.5, c('Original', 'Simulation'), col = c(1,2), lty = c(1,2), cex = 0.6)

## ----Example_2_Summary---------------------------------------------------
summary(ahn)

## ----Example_2_Network_Visualization-------------------------------------
visualize(ahn)

