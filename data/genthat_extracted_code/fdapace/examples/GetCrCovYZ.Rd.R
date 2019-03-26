library(fdapace)


### Name: GetCrCovYZ
### Title: Functional Cross Covariance between longitudinal variable Y and
###   scalar variable Z
### Aliases: GetCrCovYZ

### ** Examples

Ly <- list( runif(5),  c(1:3), c(2:4), c(4))
Lt <- list( c(1:5), c(1:3), c(1:3), 4)
Z = rep(4,4) # Constant vector so the covariance has to be zero.
sccObj = GetCrCovYZ(bw=1, Z= Z, Ly=Ly, Lt=Lt, Ymu=rep(4,5))



