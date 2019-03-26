library(spMC)


### Name: mixplot
### Title: Plot of Multiple One-dimensional Transiograms
### Aliases: mixplot
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Estimate empirical transition 
# probabilities by points
ETr <- transiogram(ACM$MAT3, ACM[, 1:3], c(0, 0, 1), 100)

# Estimate the transition rate matrix
RTm <- tpfit(ACM$MAT3, ACM[, 1:3], c(0, 0, 1))

# Compute transition probabilities 
# from the one-dimensional MC model
TPr <- predict(RTm, lags = ETr$lags)

# Plot empirical vs. theoretical transition probabilities
mixplot(list(ETr, TPr), type = c("p", "l"), pch = "+", col = c(3, 1))
## End(No test)


