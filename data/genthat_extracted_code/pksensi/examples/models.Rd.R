library(pksensi)


### Name: pk_model
### Title: Example PK Model for Sensitivity Analysis
### Aliases: pk_model FFPK

### ** Examples

params <- c(F = 0.9, KA = 1.2, KE = 0.2, V = 1.5)
t <- seq(0, 12, 0.1)
C <-FFPK(params = params, time = t)
plot(t, C, type = "l", xlab = "time", ylab = "concentration")




