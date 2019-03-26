library(dbmss)


### Name: Lmmhat
### Title: Estimation of the Lmm function
### Aliases: Lmmhat

### ** Examples

data(paracou16)
# Keep only 50% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.5))
plot(X)

# Calculate Lmm
r <- seq(0, 30, 2)
(Paracou <- Lmmhat(X, r))

# Plot
plot(Paracou)



