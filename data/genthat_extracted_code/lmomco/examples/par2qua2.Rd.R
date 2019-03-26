library(lmomco)


### Name: par2qua2
### Title: Equivalent Quantile Function of Two Distributions
### Aliases: par2qua2
### Keywords: quantile mixture function distribution (mixture) mixed
###   distribution

### ** Examples

lmr <- lmoms(rnorm(20)); left <- parnor(lmr); right <- pargev(lmr)
mixed.median <- par2qua2(0.5, left, right)

# Bigger example--using Kappa fit to whole sample for the right tail and
# Normal fit to whole sample for the left tail
D   <- c(123, 523, 345, 356, 2134, 345, 2365, 235, 12, 235, 61, 432, 843)
lmr <- lmoms(D); KAP <- parkap(lmr); NOR <- parnor(lmr); PP <- pp(D)
plot( PP, sort(D), ylim=c(-500, 2300))
lines(PP, par2qua( PP, KAP),      col=2)
lines(PP, par2qua( PP, NOR),      col=3)
lines(PP, par2qua2(PP, NOR, KAP), col=4)



