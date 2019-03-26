### R code from vignette source 'rlmer.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: init-hidden
###################################################
options(width = 60, str = strOptions(vec.len = 1.4), prompt = 'R> ', continue = '+  ')


###################################################
### code chunk number 2: init
###################################################
require("robustlmm")
source(system.file("doc/Penicillin.R", package = "robustlmm"))


###################################################
### code chunk number 3: plot-figure1 (eval = FALSE)
###################################################
## require(ggplot2)
## require(reshape2)
## theme_set(theme_bw())
## print(ggplot(PenicillinC, aes(plate, diameter, color = sample)) +
##   geom_point(aes(shape = contaminated), size = 2.5) +
##   geom_line(aes(as.numeric(plate))) +
##   scale_colour_brewer("Sample", palette = "Dark2") +
##   scale_shape_manual('', values = c(4, 20)) +
##   scale_y_continuous(breaks = c(0, 5, 10, 15, 20, 25)) +
##   theme(legend.position = "bottom", legend.box = "horizontal") +
##   xlab("Plate") + ylab('Diameter growth\n inhibition zone (mm)'))


###################################################
### code chunk number 4: strPC
###################################################
str(PenicillinC)


###################################################
### code chunk number 5: fitPC
###################################################
fm  <-  lmer(diameter ~ (1|plate) + (1|sample), PenicillinC)
rfm <- rlmer(diameter ~ (1|plate) + (1|sample), PenicillinC)


###################################################
### code chunk number 6: summaryPC
###################################################
summary(rfm)


###################################################
### code chunk number 7: plotPC1
###################################################
require(ggplot2)
theme_set(theme_bw())
print(plot(rfm, which = 1)[[1]] + scale_color_continuous(guide = "none"))


###################################################
### code chunk number 8: plotPC2
###################################################
print(plot(rfm, which = 2)[[1]] + scale_color_continuous(guide = "none"))


###################################################
### code chunk number 9: plotPC3
###################################################
print(plot(rfm, which = 3)[[1]] + theme(legend.position = "bottom"))


###################################################
### code chunk number 10: updatePC1
###################################################
rfm2 <- update(rfm, rho.sigma.e = psi2propII(smoothPsi, k = 2.28),
  rho.sigma.b = psi2propII(smoothPsi, k = 2.28))


###################################################
### code chunk number 11: updatePC2
###################################################
rsb <- list(psi2propII(smoothPsi), psi2propII(smoothPsi, k = 2.28))
rfm3 <- update(rfm2, rho.sigma.b = rsb) 


###################################################
### code chunk number 12: setOptions1
###################################################
oldopts <- options(width = 90)


###################################################
### code chunk number 13: comparePC
###################################################
fmUncontam <- update(fm, data = Penicillin)
compare(fmUncontam, fm, rfm, rfm2, rfm3, show.rho.functions = FALSE)


###################################################
### code chunk number 14: setOptions2
###################################################
options(oldopts)


###################################################
### code chunk number 15: smoothedHuber
###################################################
require(reshape2)
xs <- seq.int(0, 3, length.out = 100)
data <- data.frame(x = xs, Huber = huberPsiRcpp@psi(xs),
  "Smoothed" = smoothPsi@psi(xs))
print(ggplot(melt(data, 1), aes(x, value, color = variable, 
  linetype = variable)) + geom_line() +
  scale_colour_hue(expression(paste(psi, "-function"))) +
  scale_linetype_discrete(expression(paste(psi, "-function"))) +
  ylab(expression(psi(x))) +
  theme(legend.position = "bottom", legend.box = "horizontal"))


###################################################
### code chunk number 16: convergence-setup (eval = FALSE)
###################################################
## require(robustbase)
## require(reshape2)
## Psi <- smoothPsi
## c.sigma <- 2.38
## wExp <- 2


###################################################
### code chunk number 17: convergence (eval = FALSE)
###################################################
## rfm <- rlmer(Yield ~ (1 | Batch), Dyestuff, rho.e = Psi, rho.b = Psi,
##   rho.sigma.e = if (wExp == 2) psi2propII(Psi, k = c.sigma) else Psi,
##   rho.sigma.b = if (wExp == 2) psi2propII(Psi, k = c.sigma) else Psi)
## true <- robustlmm:::theta(rfm)
## kappa <- robustlmm:::calcKappaTau(rfm@rho.sigma.b[[1]])
## fun <- function(theta, rfm) {
##   robustlmm:::theta(rfm) <- theta
##   T <- diag(robustlmm:::len(rfm, "b")) - 
##     robustlmm:::rho.b(rfm)[[1]]@EDpsi() * (rfm@pp$L + t(rfm@pp$L)) +
##     robustlmm:::rho.e(rfm)@Epsi2() * crossprod(rfm@pp$Kt) +
##     robustlmm:::rho.b(rfm)[[1]]@Epsi2() * tcrossprod(rfm@pp$L)
##   c(theta, mean(getME(rfm, "u")^2)/getME(rfm, "sigma")^2, mean(diag(T))*kappa
##     ,mean(diag(robustlmm:::rho.b(rfm)[[1]]@EDpsi() * (rfm@pp$L + t	(rfm@pp$L))))
##     ,mean(diag(robustlmm:::rho.e(rfm)@Epsi2() * crossprod(rfm@pp$Kt)))
##     ,mean(diag(robustlmm:::rho.b(rfm)[[1]]@Epsi2() * tcrossprod(rfm@pp$L)))
##     ,mean(diag(rfm@pp$D_b))
##   )
## }
## thetas <- exp(seq(0, log(4), length.out = 100)) - 1
## ssq <- sapply(thetas, fun, rfm = rfm)
## print(head(t(ssq)))
## test.1 <- data.frame(t(ssq[1:3,]))
## colnames(test.1) <- c("theta", "realized", "expected")
## test.1$difference <- test.1$realized - test.1$expected
## ## find wrong root
## spl <- splinefun(test.1$theta, test.1$difference)
## false <- uniroot(spl, c(0, with(test.1, theta[which.max(difference)])))$root
## ## plot
## test.1 <- melt(test.1, "theta")
## print(ggplot(test.1, aes(theta, value, color = variable)) +
##   geom_line() + geom_vline(xintercept = c(true, false), linetype = 2) +      
##   scale_x_continuous(breaks = c(0:3, false, true), 
##     labels = c(0:3, expression(theta^"\u2020"), expression(hat(theta)))) +
##   xlab(expression(theta)) + geom_hline(yintercept = 0) +
##   theme(legend.position = "bottom", legend.box = "horizontal"))


