library(GMCM)


### Name: inv.rho.transform
### Title: Transformation of the correlation to real line and its inverse
### Aliases: inv.rho.transform rho.transform
### Keywords: internal

### ** Examples

d <- 4
rho <- runif(100, -1/(d-1), 1)
a <- GMCM:::rho.transform(rho, d)
rho - GMCM:::inv.rho.transform(a, d)



