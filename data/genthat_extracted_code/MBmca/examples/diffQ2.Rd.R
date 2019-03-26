library(MBmca)


### Name: diffQ2
### Title: Calculation of the melting temperatures (Tm, Tm1D2 and Tm2D2)
###   from the first and the second derivative
### Aliases: diffQ2
### Keywords: Tm

### ** Examples

# First Example
# Plot the first and the second derivative melting curves of MLC-2v
# for a single melting curve. Should give a warning message but the graph
# will show you that the calculation is ok
data(MultiMelt)
tmp <- mcaSmoother(MultiMelt[, 1], MultiMelt[, 14])
diffQ2(tmp, fct = min, verbose = FALSE, plot = TRUE)

# Second Example
# Calculate the maximum fluorescence of a melting curve, Tm,
# Tm1D2 and Tm2D2 of HPRT1 for 12 microbead populations and assign the
# values to the matrix HPRT1
data(MultiMelt)
HPRT1 <- matrix(NA,12,4,
	dimnames = list(colnames(MultiMelt[, 2L:13]),
	    c("Fluo", "Tm", "Tm1D2", "Tm2D2")))
for (i in 2L:13) {
       tmp <- mcaSmoother(MultiMelt[, 1],
                     MultiMelt[, i])
       tmpTM <- diffQ2(tmp, fct = min, verbose = TRUE)
       HPRT1[i-1, 1] <- max(tmp$y)
       HPRT1[i-1, 2] <- tmpTM$TmD1$Tm
       HPRT1[i-1, 3] <- tmpTM$Tm1D2$Tm
       HPRT1[i-1, 4] <- tmpTM$Tm2D2$Tm
}
HPRT1

# Third Example
# Use diffQ2 to determine the second derivative.

data(MultiMelt)
HPRT1 <- matrix(NA,12,4,
	dimnames = list(colnames(MultiMelt[, 2L:13]),
	    c("Fluo", "Tm", "Tm1D2", "Tm2D2")))
for (i in 2L:13) {
       tmp <- mcaSmoother(MultiMelt[, 1],
                     MultiMelt[, i])
       tmpTM <- diffQ2(tmp, fct = min, verbose = TRUE)
       HPRT1[i-1, 1] <- max(tmp[["y.sp"]])
       HPRT1[i-1, 2] <- tmpTM[["TmD1"]][["Tm"]]
       HPRT1[i-1, 3] <- tmpTM[["Tm1D2"]][["Tm"]]
       HPRT1[i-1, 4] <- tmpTM[["Tm2D2"]][["Tm"]]
}
plot(HPRT1[, 1], HPRT1[, 2],
       xlab = "refMFI", ylab = "Temperature",
       main = "HPRT1", xlim = c(2.1,2.55),
       ylim = c(72,82), pch = 19,
       col = 1:12, cex = 1.8)
points(HPRT1[, 1], HPRT1[, 3], pch = 15)
points(HPRT1[, 1], HPRT1[, 4], pch = 15)
abline(lm(HPRT1[, 2] ~ HPRT1[, 1]))
abline(lm(HPRT1[, 3] ~ HPRT1[, 1]))
abline(lm(HPRT1[, 4] ~ HPRT1[, 1]))

# Fourth Example
# Use diffQ2 with inder parameter to determine the second derivative.
data(MultiMelt)

tmp <- mcaSmoother(MultiMelt[, 1], MultiMelt[, 14])
diffQ2(tmp, fct = min, verbose = FALSE, plot = TRUE, inder = FALSE)
diffQ2(tmp, fct = min, verbose = FALSE, plot = TRUE, inder = TRUE)
par(mfrow = c(1,1))



