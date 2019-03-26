library(uGMAR)


### Name: get_regime_means
### Title: Calculate and return regime means mu_{m}
### Aliases: get_regime_means

### ** Examples

# GMAR model
params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
gmar13 <- GSMAR(data=VIX, p=1, M=3, params=params13, model="GMAR")
get_regime_means(gmar13)

# StMAR model
params12t <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 100, 3.6)
stmar12t <- GSMAR(data=VIX, p=1, M=2, params=params12t, model="StMAR")
get_regime_means(stmar12t)

# G-StMAR model (similar to the StMAR model above)
params12gs <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 3.6)
gstmar12 <- GSMAR(data=VIX, p=1, M=c(1, 1), params=params12gs,
 model="G-StMAR")
get_regime_means(gstmar12)



