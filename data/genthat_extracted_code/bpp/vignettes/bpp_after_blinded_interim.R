## ----setup, include = FALSE----------------------------------------------
now <- as.character(as.POSIXlt(Sys.time()))
today <- as.Date(substr(now, 1, 10))
now <- paste(today, " at ", substr(now, 12, 19), sep = "")

## set some knitr options
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = TRUE, message = FALSE---------------------------------------
# load the package:
library(bpp)

# get the code for all the computations below:
?bpp_1interim

# specifications of the the pivotal trial
propA <- 0.5   # proportion of patients randomized to arm A
fac <- (propA * (1 - propA)) ^ (-1)
nevents <- c(0.5, 1) * 1600
finalsigma <- sqrt(fac / nevents[2])
alphas <- c(0.001, 0.049)
za <- qnorm(1 - alphas / 2)
hrMDD <- exp(- za * sqrt(fac / nevents))
successmean <- log(hrMDD[2])

# efficacy and futility interim boundary
effi <- log(hrMDD[1])
futi <- log(1.025)

# specifications of the first external study
hr1 <- 0.396
sd1 <- 0.837

# specifications of the second external study
hr2 <- 0.287
sd2 <- 0.658

# grid to compute densities on
thetas <- seq(-0.65, 0.3, by = 0.01)

## ---- echo = TRUE, message = FALSE---------------------------------------
# ----------------------------------
# mean and sd of Normal prior:
# ----------------------------------
hr0 <- 0.85
sd0 <- 0.11

# all computations are done on the log(hazard ratio) scale, in order to 
# be able to approximate the distribution of the log(hazard ratio) via a
# Normal distribution:
priormean <- log(hr0)

# ----------------------------------
# parameters of pessimistic, or flat, prior:
# ----------------------------------
hr0flat <- 0.866
priormean <- log(hr0flat)
width1 <- 0.21
height1 <- 2.48

## ---- echo = TRUE, results = 'asis', message = FALSE, fig.cap = "", fig.align = "center", fig.width = 7, fig.height = 5.5----
par(las = 1, mar = c(9, 5, 2, 1), mfrow = c(1, 1))
plot(0, 0, type = "n", xlim = c(-0.6, 0.3), ylim = c(-0.1, 5), xlab = "", ylab = "density", main = "")
title(expression("Normal and pessimistic prior density for "*theta), line = 0.7)
basicPlot(leg = FALSE, IntEffBoundary = NA, IntFutBoundary = NA, successmean = NA, priormean = NA)
lines(thetas, dnorm(thetas, mean = log(hr0), sd = sd0), col = 2, lwd = 2)
lines(thetas, dUniformNormalTails(thetas, mu = log(hr0flat), width = width1, height = height1), lwd = 2, col = 3)

## ---- echo = TRUE, message = FALSE---------------------------------------
# Normal prior probabilities to be below 0.7 or above 1:
lims <- c(0.7, 1)
pnorm1 <- plnorm(lims[1], meanlog = log(hr0), sdlog = sd0, lower.tail = TRUE, log.p = FALSE)   
pnorm2 <- plnorm(lims[2], meanlog = log(hr0), sdlog = sd0, lower.tail = FALSE, log.p = FALSE)

## ---- echo = TRUE, message = FALSE---------------------------------------
# pessimistic prior probabilities to be below 0.7 or above 1:
flat1 <- pUniformNormalTails(x = log(lims[1]), mu = priormean, width = width1, height = height1)
flat2 <- 1 - pUniformNormalTails(x = log(lims[2]), mu = priormean, width = width1, 
                                 height = height1)

## ---- echo = TRUE, message = FALSE---------------------------------------
# ----------------------------------
# Normal prior:
# ----------------------------------
bpp0 <- bpp(prior = "normal", successmean = successmean, finalsigma = finalsigma, 
            priormean = log(hr0), priorsigma = sd0)

# ----------------------------------
# pessimistic prior:
# ----------------------------------
bpp0_1 <- bpp(prior = "flat", successmean = successmean, finalsigma = finalsigma, 
              priormean = priormean, width = width1, height = height1)

## ---- echo = TRUE, message = FALSE---------------------------------------
# ----------------------------------
# Normal prior:
# ----------------------------------
up1 <- NormalNormalPosterior(datamean = log(hr1), datasigma = sd1, n = 1, nu = log(hr0), 
                             tau = sd0)
bpp1 <- bpp(prior = "normal", successmean = successmean, finalsigma = finalsigma, 
            priormean = up1$postmean, priorsigma = up1$postsigma)

# update prior with second external study (result derived from pooled analysis: 
# Cox regression on patient level, stratified by study):
up2 <- NormalNormalPosterior(datamean = log(hr2), datasigma = sd2, n = 1, nu = log(hr0), 
                             tau = sd0)
bpp2 <- bpp(prior = "normal", successmean = successmean, finalsigma = finalsigma, 
            priormean = up2$postmean, priorsigma = up2$postsigma)

# ----------------------------------
# pessimistic prior
# ----------------------------------
bpp1_1 <- integrate(FlatNormalPosterior, lower = -Inf, upper = Inf, successmean = successmean, 
                     finalsigma = finalsigma, datamean = log(hr1), datasigma = sd1, 
                     priormean = priormean, width = width1, height = height1)$value

bpp2_1 <- integrate(FlatNormalPosterior, -Inf, Inf, successmean = successmean, 
                     finalsigma = finalsigma, datamean = log(hr2), 
                     datasigma = sd2, priormean = priormean, 
                     width = width1, height = height1)$value

## ---- echo = TRUE, message = FALSE---------------------------------------
# ----------------------------------
# compute bpp after not stopping at interim, for Normal prior and various 
# assumptions on the amount of information we learn at the interim
# ----------------------------------

# assuming both boundaries:
bpp3.tmp <- bpp_1interim(prior = "normal", datasigma = sqrt(fac / nevents[1]), 
                         finalsigma = finalsigma, successmean = successmean, 
                         IntEffBoundary = effi, IntFutBoundary = futi, IntFix = 1, 
                         priormean = up2$postmean, propA = 0.5, thetas, 
                         priorsigma = up2$postsigma)
bpp3 <- bpp3.tmp$"BPP after not stopping at interim interval"
post3 <- bpp3.tmp$"posterior density interval"

# assuming only efficacy boundary:
bpp3_effi_only <- bpp_1interim(prior = "normal", datasigma = sqrt(fac / nevents[1]), 
                               finalsigma = finalsigma, successmean = successmean, 
                               IntEffBoundary = effi, IntFutBoundary = log(Inf), IntFix = 1, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               priorsigma = 
                               up2$postsigma)$"BPP after not stopping at interim interval"

# assuming only futility boundary:
bpp3_futi_only <- bpp_1interim(prior = "normal", datasigma = sqrt(fac / nevents[1]), 
                               finalsigma = finalsigma, successmean = successmean, 
                               IntEffBoundary = log(0), IntFutBoundary = futi, IntFix = 1, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               priorsigma = 
                               up2$postsigma)$"BPP after not stopping at interim interval"

# assuming interim efficacy boundary: 
bpp4.tmp <- bpp_1interim(prior = "normal", datasigma = sqrt(fac / nevents[1]), 
                         finalsigma = finalsigma, successmean = successmean, 
                         IntEffBoundary = effi, IntFutBoundary = Inf, IntFix = c(effi, futi), 
                         priormean = up2$postmean, propA = 0.5, thetas, 
                         priorsigma = up2$postsigma)
bpp4 <- bpp4.tmp$"BPP after not stopping at interim exact"[2, 1]
post4 <- bpp4.tmp$"posterior density exact"[, 1]

# assuming interim futility boundary: 
bpp5.tmp <- bpp_1interim(prior = "normal", datasigma = sqrt(fac / nevents[1]), 
                         finalsigma = finalsigma, successmean = successmean, 
                         IntEffBoundary = effi, IntFutBoundary = Inf, IntFix = futi, 
                         priormean = up2$postmean, propA = 0.5, thetas, 
                         priorsigma = up2$postsigma)
bpp5 <- bpp5.tmp$"BPP after not stopping at interim exact"[2, 1]
post5 <- bpp5.tmp$"posterior density exact"     # same as post4[, 2]

## ---- echo = TRUE, message = FALSE---------------------------------------
# ----------------------------------
# compute bpp after not stopping at interim, for pessimistic prior and various 
# assumptions on the amount of information we learn at the interim
# ----------------------------------

# assuming both boundaries:
bpp3.tmp_1 <- bpp_1interim(prior = "flat", datasigma = sqrt(fac / nevents[1]), 
                         finalsigma = finalsigma, successmean = successmean, 
                         IntEffBoundary = effi, IntFutBoundary = futi, IntFix = 1, 
                         priormean = up2$postmean, propA = 0.5, thetas, 
                         width = width1, height = height1)
bpp3_1 <- bpp3.tmp_1$"BPP after not stopping at interim interval"
post3_1 <- bpp3.tmp_1$"posterior density interval"

# assuming only efficacy boundary:
bpp3_1_effi_only <- bpp_1interim(prior = "flat", datasigma = sqrt(fac / nevents[1]), 
                               finalsigma = finalsigma, successmean = successmean, 
                               IntEffBoundary = effi, IntFutBoundary = log(Inf), IntFix = 1, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               width = width1, 
                               height = height1)$"BPP after not stopping at interim interval"

# assuming only futility boundary:
bpp3_1_futi_only <- bpp_1interim(prior = "flat", datasigma = sqrt(fac / nevents[1]), 
                               finalsigma = finalsigma, successmean = successmean, 
                               IntEffBoundary = log(0), IntFutBoundary = futi, IntFix = 1, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               width = width1, 
                               height = height1)$"BPP after not stopping at interim interval"

# assuming interim efficacy boundary: 
bpp4_1.tmp <- bpp_1interim(prior = "flat", datasigma = sqrt(fac / nevents[1]), 
                               finalsigma = finalsigma, successmean = successmean, 
                               IntEffBoundary = log(0), IntFutBoundary = effi, IntFix = effi, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               width = width1, height = height1)
bpp4_1 <- bpp4_1.tmp$"BPP after not stopping at interim exact"[2, 1]
post4_1 <- bpp4_1.tmp$"posterior density exact"

# assuming interim futility boundary: 
bpp5_1 <- integrate(Vectorize(estimate_toIntegrate), lower = -Inf, upper = Inf, prior = "flat",
                    successmean = successmean, finalsigma = finalsigma, datamean = futi, 
                    datasigma = sqrt(fac / nevents[1]), priormean = up2$postmean, 
                    width = width1, height = height1)$value


bpp5_1.tmp <- bpp_1interim(prior = "flat", datasigma = sqrt(fac / nevents[1]), 
                           finalsigma = finalsigma, successmean = successmean, 
                           IntEffBoundary = log(0), IntFutBoundary = effi, IntFix = futi, 
                               priormean = up2$postmean, propA = 0.5, thetas = thetas, 
                               width = width1, height = height1)
bpp5_1 <- bpp5_1.tmp$"BPP after not stopping at interim exact"[2, 1]
post5_1 <- bpp5_1.tmp$"posterior density exact"

## ---- echo = TRUE, results = 'asis', message = FALSE, fig.cap = "", fig.align = "center", fig.width = 7, fig.height = 5----
par(las = 1, mar = c(9, 5, 2, 1), mfrow = c(1, 2), cex = 0.8)

# ----------------------------------
# Normal prior:
# ----------------------------------
plot(0, 0, type = "n", xlim = c(-0.6, 0.3), ylim = c(-0.1, 5), xlab = "", ylab = "density", 
     main = "")
title(expression("Normal prior density and corresponding posteriors for "*theta), line = 0.7)
basicPlot(leg = FALSE, IntEffBoundary = effi, IntFutBoundary = futi, successmean = successmean, 
          priormean = priormean)
lines(thetas, dnorm(thetas, mean = log(hr0), sd = sd0), col = 2, lwd = 2)
lines(thetas, dnorm(thetas, mean = up1$postmean, sd = up1$postsigma), col = 3, lwd = 2)
lines(thetas, dnorm(thetas, mean = up2$postmean, sd = up2$postsigma), col = 4, lwd = 2)
lines(thetas, post3, col = 1, lwd = 2)
legend(-0.64, 5.2, c("prior", "posterior after Sub1", "posterior after Sub1 & Sub2", 
       "posterior after Sub1 & Sub2 and not stopping at interim"), lty = 1, col = c(2:4, 1), 
       bty = "n", lwd = 2)

# ----------------------------------
# pessimistic prior:
# ----------------------------------

# first we have to compute the posteriors after the external updates:
flatpost1 <- rep(NA, length(thetas))
flatpost2 <- flatpost1
for (i in 1:length(thetas)){
  flatpost1[i] <- estimate_posterior(x = thetas[i], prior = "flat", datamean = log(hr1), 
                                     datasigma = sd1, priormean = priormean, width = width1, 
                                     height = height1)
  flatpost2[i] <- estimate_posterior(x = thetas[i], prior = "flat", datamean = log(hr2), 
                                     datasigma = sd2, priormean = priormean, width = width1, 
                                     height = height1)
}

plot(0, 0, type = "n", xlim = c(-0.6, 0.3), ylim = c(-0.10, 5), xlab = "", ylab = "density", main = "")
title(expression("Flat prior density and corresponding posteriors for "*theta), line = 0.7)
basicPlot(leg = FALSE, IntEffBoundary = effi, IntFutBoundary = futi, successmean = successmean, 
          priormean = priormean)
lines(thetas, dUniformNormalTails(thetas, mu = priormean, width = width1, height = height1), 
      lwd = 2, col = 2)
lines(thetas, flatpost1, col = 3, lwd = 2)
lines(thetas, flatpost2, col = 4, lwd = 2)
lines(thetas, post3_1, col = 1, lwd = 2)

legend(-0.64, 5.2, c("prior", "posterior after Sub1", "posterior after Sub1 & Sub2", 
       "posterior after Sub1 & Sub2 and not stopping at interim"), lty = 1, col = c(2:4, 1), 
       bty = "n", lwd = 2)

## ---- echo = TRUE, results = 'asis', message = FALSE, fig.cap = "", fig.align = "center", fig.width = 7, fig.height = 5.5----
par(las = 1, mar = c(9, 5, 2, 1), mfrow = c(1, 2), cex = 0.8)

# ----------------------------------
# Normal prior:
# ----------------------------------
plot(0, 0, type = "n", xlim = c(-0.6, 0.3), ylim = c(-0.1, 8), xlab = "", ylab = "density", 
     main = "")
title("Posteriors for after not stopping at interim, Normal prior", line = 0.7)
basicPlot(leg = FALSE, IntEffBoundary = effi, IntFutBoundary = futi, successmean = successmean, 
          priormean = priormean)
lines(thetas, post3, col = 1, lwd = 2)
lines(thetas, post4, col = 2, lwd = 2)
lines(thetas, post5, col = 3, lwd = 2)
leg2 <- c("interval knowledge", expression(hat(theta)*" = efficacy boundary"), 
          expression(hat(theta)*" = futility boundary"))
legend(-0.62, 8.2, leg2, lty = 1, col = 1:3, lwd = 2, bty = "n", 
       title = "posterior after not stopping at interim,")

# ----------------------------------
# pessimistic prior:
# ----------------------------------
plot(0, 0, type = "n", xlim = c(-0.6, 0.3), ylim = c(-0.10, 8), xlab = "", ylab = "density", 
     main = "")
title("Posteriors after not stopping at interim, pessimistic prior", line = 0.7)
basicPlot(leg = FALSE, IntEffBoundary = effi, IntFutBoundary = futi, successmean = successmean, 
          priormean = priormean)
lines(thetas, post3_1, col = 1, lwd = 2)
lines(thetas, post4_1, col = 2, lwd = 2)
lines(thetas, post5_1, col = 3, lwd = 2)
leg.flat <- c("interval knowledge", expression(hat(theta)*" = efficacy boundary"), 
              expression(hat(theta)*" = futility boundary"))
legend(-0.62, 8.2, leg.flat, lty = 1, col = 1:3, lwd = 2, bty = "n", 
       title = "posterior after not stopping at interim,")

## ---- echo = TRUE, results = 'asis', message = FALSE---------------------
mat <- matrix(NA, ncol = 2, nrow = 10)
mat[, 1] <- c(pnorm1, pnorm2, bpp0, bpp1, bpp2, bpp3, bpp3_futi_only, bpp3_effi_only, bpp4, bpp5)
mat[, 2] <- c(flat1, flat2, bpp0_1, bpp1_1, bpp2_1, bpp3_1, bpp3_1_futi_only, bpp3_1_effi_only, 
              bpp4_1, bpp5_1)
colnames(mat) <- c("Normal prior", "Flat prior")
rownames(mat) <- c(paste("Probability for hazard ratio to be $\\le$ ", lims[1], sep = ""), 
paste("Probability for hazard ratio to be $\\ge$ ", lims[2], sep = ""), 
"PoS based on prior distribution", "PoS after Sub1", "PoS after Sub1 and Sub2", 
"PoS after not stopping at interim, assuming $\\hat \\theta \\in [\\theta_{futi}, \\theta_{effi}]$", 
"PoS after not stopping at interim, assuming $\\hat \\theta \\in [-\\infty, \\theta_{futi}]$", 
"PoS after not stopping at interim, assuming $\\hat \\theta \\in [\\theta_{effi}, \\infty]$", 
"PoS after not stopping at interim, assuming $\\hat \\theta = \\theta_{effi}$", 
"PoS after not stopping at interim, assuming $\\hat \\theta = \\theta_{futi}$")
mat <- as.data.frame(format(mat, digits = 2))
library(knitr); kable(mat)

## ---- echo = TRUE, message = FALSE---------------------------------------
# ------------------------------------------------------------------------------------------
# Illustrate the update after two passed interims using the Gallium clinical trial
# ------------------------------------------------------------------------------------------

# mean and sd of Normal prior:
hr0 <- 0.9288563
priormean <- log(hr0)
priorsigma <- sqrt(4 / 12)

# specifications for pivotal study:
propA <- 0.5   
fac <- (propA * (1 - propA)) ^ (-1)
nevents <- c(111, 248, 370)
datasigma <- sqrt(fac / nevents[1:2])
finalsigma <- sqrt(fac / nevents[3])
za <- c(3.9285726330559, 2.5028231888636, 1.9936294555664)
alphas <- 2 * (1 - pnorm(za))
hrMDD <- exp(- za * sqrt(fac / nevents))
successmean <- log(hrMDD[3])

# 2-d vector of efficacy and futility interim boundaries:
effi <- log(c(0, hrMDD[2]))  # first interim is for futility only
futi <- log(c(1, Inf))       # second interim is for efficacy only

bpp2 <- bpp_2interim(prior = "normal", datasigma = datasigma, finalsigma = finalsigma, 
             successmean = successmean, IntEffBoundary = effi, IntFutBoundary = futi, 
             priormean = priormean, thetas = thetas, priorsigma = priorsigma)

bpp2$"initial BPP"
bpp2$"BPP after not stopping at interim interval"

