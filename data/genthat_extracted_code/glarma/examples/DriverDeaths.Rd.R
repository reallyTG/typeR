library(glarma)


### Name: DriverDeaths
### Title: Single Vehicle Nighttime Driver Deaths in Utah
### Aliases: DriverDeaths
### Keywords: datasets

### ** Examples

### Model number of deaths
data(DriverDeaths)
y <- DriverDeaths[, "Deaths"]
X <- as.matrix(DriverDeaths[, 2:5])
Population <- DriverDeaths[, "Population"]

### Offset included
glarmamodOffset <- glarma(y, X, offset = log(Population/100000),
                          phiLags = c(12),
                          type = "Poi", method = "FS",
                          residuals = "Pearson", maxit = 100, grad = 1e-6)
print(summary(glarmamodOffset))
par(mfrow =c(3,2))
plot(glarmamodOffset)


### No offset included
glarmamodNoOffset <- glarma(y, X, phiLags = c(12),
                            type = "Poi", method = "FS",
                            residuals = "Pearson", maxit = 100, grad = 1e-6)
print(summary(glarmamodNoOffset))
par(mfrow=c(3,2))
plot(glarmamodNoOffset)



