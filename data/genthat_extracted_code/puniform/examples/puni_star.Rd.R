library(puniform)


### Name: puni_star
### Title: p-uniform*
### Aliases: puni_star

### ** Examples

### Generate data for one-sample mean with mu = 0.2 and tau^2 = 0.01
set.seed(123)
ni <- rep(50, 25)
sdi <- rep(1, 25)
ui <- rnorm(25, mean = 0.2, sd = 0.1)
mi <- rnorm(25, mean = ui, sd = sdi/sqrt(ni))
tobs <- mi/(sdi/sqrt(ni))

### Apply p-uniform* method using sample means
puni_star(mi = mi, ni = ni, sdi = sdi, alpha = 0.05, side = "right", method = "ML")

### Apply p-uniform* method using t-values
puni_star(tobs = tobs, ni = ni, alpha = 0.05, side = "right", method = "ML")




