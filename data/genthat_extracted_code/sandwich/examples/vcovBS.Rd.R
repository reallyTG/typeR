library(sandwich)


### Name: vcovBS
### Title: (Clustered) Bootstrap Covariance Matrix Estimation
### Aliases: vcovBS vcovBS.default vcovBS.lm vcovBS.glm .vcovBSenv
### Keywords: regression bootstrap

### ** Examples

## Petersen's data
data("PetersenCL", package = "sandwich")
m <- lm(y ~ x, data = PetersenCL)

## comparison of different standard errors
set.seed(1)
cbind(
  "classical" = sqrt(diag(vcov(m))),
  "HC-cluster" = sqrt(diag(vcovCL(m, cluster = ~ firm))),
  "BS-cluster" = sqrt(diag(vcovBS(m, cluster = ~ firm)))
)

## two-way wild cluster bootstrap with Mammen distribution
vcovBS(m, cluster = ~ firm + year, type = "wild-mammen")



