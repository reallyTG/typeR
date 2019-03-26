library(sSDR)


### Name: sOLS.comp.d
### Title: Structured OLS (sOLS) outer level BIC criterion to estimate
###   dimension with eigen-decomposition
### Aliases: sOLS.comp.d

### ** Examples

v1 <- c(1, 1, 0, 0)
v2 <- c(0, 1, 1, 0)
v3 <- c(0, 0, 1, 1)
v4 <- c(1, 1, 1, 1)
m1 <- cbind(v1, v2)
sizes1 <- c(100, 200)
sOLS.comp.d(m1, sizes1)
m2 <- cbind(v1, v2, v3)
sizes2 <- c(100, 200, 500)
sOLS.comp.d(m2, sizes2)
m3 <- cbind(v1, v3, v4)
sizes3 <- c(100, 500, 1000)
sOLS.comp.d(m3, sizes3)



