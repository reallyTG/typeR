library(VGAM)


### Name: rrar
### Title: Nested Reduced-rank Autoregressive Models for Multiple Time
###   Series
### Aliases: rrar
### Keywords: ts regression models

### ** Examples

## Not run: 
##D year <- seq(1961 + 1/12, 1972 + 10/12, by = 1/12)
##D par(mar = c(4, 4, 2, 2) + 0.1, mfrow = c(2, 2))
##D for (ii in 1:4) {
##D   plot(year, grain.us[, ii], main = names(grain.us)[ii], las = 1,
##D        type = "l", xlab = "", ylab = "", col = "blue")
##D   points(year, grain.us[, ii], pch = "*", col = "blue")
##D }
##D apply(grain.us, 2, mean)  # mu vector
##D cgrain <- scale(grain.us, scale = FALSE)  # Center the time series only
##D fit <- vglm(cgrain ~ 1, rrar(Ranks = c(4, 1)), trace = TRUE)
##D summary(fit)
##D 
##D print(fit@misc$Ak1, digits = 2)
##D print(fit@misc$Cmatrices, digits = 3)
##D print(fit@misc$Dmatrices, digits = 3)
##D print(fit@misc$omegahat, digits = 3)
##D print(fit@misc$Phimatrices, digits = 2)
##D 
##D par(mar = c(4, 4, 2, 2) + 0.1, mfrow = c(4, 1))
##D for (ii in 1:4) {
##D   plot(year, fit@misc$Z[, ii], main = paste("Z", ii, sep = ""),
##D        type = "l", xlab = "", ylab = "", las = 1, col = "blue")
##D   points(year, fit@misc$Z[, ii], pch = "*", col = "blue")
##D }
## End(Not run)



