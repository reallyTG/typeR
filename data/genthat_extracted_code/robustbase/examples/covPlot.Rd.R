library(robustbase)


### Name: plot.mcd
### Title: Robust Distance Plots
### Aliases: covPlot plot.mcd
### Keywords: hplot robust multivariate

### ** Examples

data(Animals, package ="MASS")
brain <- Animals[c(1:24, 26:25, 27:28),]
mcd <- covMcd(log(brain))

plot(mcd, which = "distance", classic = TRUE)# 2 plots
plot(mcd, which = "dd")
plot(mcd, which = "tolEllipsePlot", classic = TRUE)
op <- par(mfrow = c(2,3))
plot(mcd) ## -> which = "all" (5 plots)
par(op)

## same plots for another robust Cov estimate:
data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cOGK <- covOGK(hbk.x, n.iter = 2, sigmamu = scaleTau2,
               weight.fn = hard.rejection)
covPlot(hbk.x, m.cov = cOGK, classic = TRUE)



