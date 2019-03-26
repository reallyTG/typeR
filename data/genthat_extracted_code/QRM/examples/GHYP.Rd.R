library(QRM)


### Name: GHYP
### Title: Uni- and Multivariate Generalized Hyperbolic Distribution
### Aliases: dghyp dmghyp dsmghyp dghypB rghyp rmghyp rghypB
### Keywords: distribution

### ** Examples

old.par <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
ll <- c(-4, 4)
BiDensPlot(func = dmghyp, xpts = ll, ypts = ll, mu = c(0, 0),
           Sigma = equicorr(2, -0.7), lambda = 1, chi = 1, psi = 1,
           gamma = c(0, 0))
BiDensPlot(func = dmghyp, type = "contour", xpts = ll, ypts = ll,
           mu = c(0, 0), Sigma = equicorr(2, -0.7), lambda = 1,
           chi = 1, psi = 1, gamma = c(0, 0))
BiDensPlot(func = dmghyp, xpts = ll, ypts = ll, mu = c(0, 0),
           Sigma = equicorr(2, -0.7), lambda = 1, chi = 1, psi = 1,
           gamma = c(0.5, -0.5))
BiDensPlot(func = dmghyp, type = "contour", xpts = ll, ypts = ll,
           mu = c(0, 0), Sigma = equicorr(2, -0.7), lambda = 1,
           chi = 1, psi = 1, gamma = c(0.5, -0.5))
par(old.par)



