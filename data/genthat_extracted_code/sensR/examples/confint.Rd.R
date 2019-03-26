library(sensR)


### Name: confint.twoAC
### Title: Confidence intervals and profile likelihoods for parameters in
###   2AC models
### Aliases: confint.twoAC confint.profile.twoAC profile.twoAC
###   plot.profile.twoAC
### Keywords: models

### ** Examples


(fm1 <- twoAC(c(2, 2, 6)))
confint(fm1)
confint(fm1, type = "Wald")

pr1 <- profile(fm1)
confint(pr1)

pr1 <- profile(fm1, alpha = 1e-5)
par(mfrow = c(2,2))
plot(pr1)
plot(pr1, Log = FALSE, relative = TRUE)
plot(pr1, Log = TRUE, relative = TRUE)
plot(pr1, Log = TRUE, relative = FALSE)
## Don't show: 
## Test stability of CIs:
ci <- c(confint(fm1), confint(fm1, type = "Wald"))
## ci2 := dput(ci)
ci2 <- c(-0.27098319957656, 1.85925113345333, -0.108182667530717, -0.287401447110179,
0.940127921188124, 1.83592051925275)
stopifnot(
isTRUE(all.equal(ci, ci2))
)
## End(Don't show)




