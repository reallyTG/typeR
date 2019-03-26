library(ContaminatedMixt)


### Name: CNmixt
### Title: Fitting for the Parsimonious Mixtures of Contaminated Normal
###   Distributions
### Aliases: CNmixt CNmixtCV

### ** Examples


## Note that the example is extremely simplified 
## in order to reduce computation time

# Artificial data from an EEI Gaussian mixture with G = 2 components

library("mnormt")
p <- 2
set.seed(12345)
X1 <- rmnorm(n = 200, mean = rep(2, p), varcov = diag(c(5, 0.5)))
X2 <- rmnorm(n = 200, mean = rep(-2, p), varcov = diag(c(5, 0.5)))
noise <- matrix(runif(n = 40, min = -20, max = 20), nrow = 20, ncol = 2)
X <- rbind(X1, X2, noise)

group <- rep(c(1, 2, 3), times = c(200, 200, 20))
plot(X, col = group, pch = c(3, 4, 16)[group], asp = 1, xlab = expression(X[1]),
ylab = expression(X[2]))

# ---------------------- #
# Model-based clustering #
# ---------------------- #

res1 <- CNmixt(X, model = c("EEI", "VVV"), G = 2, parallel = FALSE)

summary(res1)

agree(res1, givgroup = group)

plot(res1, contours = TRUE, asp = 1, xlab = expression(X[1]), ylab = expression(X[2]))

# -------------------------- #
# Model-based classification #
# -------------------------- #

indlab <- sample(1:400, 20)
lab <- rep(0,nrow(X))
lab[indlab] <- group[indlab]
res2 <- CNmixt(X, G = 2, model = "EEI", label = lab)


agree(res2, givgroup = group)




