library(hkevp)


### Name: hkevp.expmeasure
### Title: Exponent measure of the HKEVP
### Aliases: hkevp.expmeasure

### ** Examples

sites <- as.matrix(expand.grid(1:3,1:3))
loc <- sites[,1]*10
scale <- 3
shape <- 0
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, sites, loc, scale, shape, alpha, tau)

# HKEVP fit:
fit <- hkevp.fit(ysim, sites, niter = 1000)

predict.em <- hkevp.expmeasure(1, fit = fit)
true.em <- hkevp.expmeasure(1, sites, sites, alpha, tau)
# plot(predict.em, ylim = range(predict.em, true.em), type = "l")
# abline(h = true.em, col = 2, lwd = 2)





