library(pmcgd)


### Name: MS
### Title: Fitting for the Parsimonious Mixtures of Contaminated Gaussian
###   Distributions
### Aliases: MS

### ** Examples


# Artificial data from an EEI model with k=2 components

library(mnormt)
p   <- 2
k   <- 2
eta <- c(8,8) # contamination parameters
set.seed(12345)
X1good <- rmnorm(n = 300, mean = rep(3,p), varcov = diag(c(5,0.5)))
X2good <- rmnorm(n = 300, mean = rep(-3,p), varcov = diag(c(5,0.5)))
X1bad  <- rmnorm(n = 30, mean = rep(3,p), varcov = eta[1]*diag(c(5,0.5)))
X2bad  <- rmnorm(n = 30, mean = rep(-3,p), varcov = eta[2]*diag(c(5,0.5)))
X      <- rbind(X1good,X1bad,X2good,X2bad)
plot(X, pch = 16, cex = 0.8)

# model-based clustering with the whole family of 14 
# parsimonious models and number of groups ranging from 1 to 3

overallfit <- MS(X, k = 1:2, model = c("EEI","VVV"), initialization = "mclust")  

# to see the best BIC results

bestBIC <- overallfit$bestBIC

# plot of the best BIC model

plot(X, xlab = expression(X[1]), ylab = expression(X[2]), col = "white")
text(X, labels = bestBIC$detection$innergroup, col = bestBIC$group, cex = 0.7, asp = 1)
box(col = "black")




