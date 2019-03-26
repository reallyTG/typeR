library(dbmss)


### Name: Kmmhat
### Title: Estimation of the Kmm function
### Aliases: Kmmhat

### ** Examples

data(paracou16)
# Keep only 50% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.5))
plot(X)

# Calculate Kmm
r <- seq(0, 30, 2)
(Paracou <- Kmmhat(X, r))

# Plot
plot(Paracou, ./(pi*r^2) ~ r)



