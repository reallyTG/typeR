library(spMC)


### Name: plot.transiogram
### Title: Plot One-dimensional Transiograms
### Aliases: plot.transiogram
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Estimate empirical transition 
# probabilities by points
ETr <- transiogram(ACM$MAT3, ACM[, 1:3], c(0, 0, 1), 100, 100)

# Estimate the transition rate matrix
RTm <- tpfit(ACM$MAT3, ACM[, 1:3], c(0, 0, 1))

# Compute transition probabilities 
# from the one-dimensional MC model
TPr <- predict(RTm, lags = ETr$lags)

# Plot empirical transition probabilities
plot(ETr, type = "l", ci = 0.99)

# Plot theoretical transition probabilities
plot(TPr, type = "l")
## End(No test)


