library(LW1949)


### Name: relPotency
### Title: Relative Potency of Two Toxins
### Aliases: relPotency

### ** Examples

# Example starting from raw tox data
dose <- c(0.0625, 0.125, 0.25, 0.5, 1)
ntested <- rep(8, 5)
nalive1 <- c(1, 4, 4, 7, 8)
mydat1 <- dataprep(dose=dose, ntot=ntested, nfx=nalive1)
nalive2 <- c(0, 1, 2, 6, 6)
mydat2 <- dataprep(dose=dose, ntot=ntested, nfx=nalive2)
fit1 <- LWestimate(fitLWauto(mydat1), mydat1)
fit2 <- LWestimate(fitLWauto(mydat2), mydat2)
relPotency(fit1, fit2)

# Example from Litchfield and Wilcoxon (1949)
# comparing Tagathen and Pyribenzamine
relPotency(c(0.18, 1.72, 2.20, 1.60), c(0.60, 1.60, 2.34, 1.57), vec=TRUE)

# Example in which curves differ significantly from parallelism.
relPotency(c(0.18, 1.72, 2.20, 1.60), c(0.60, 1.60, 4.34, 1.57), vec=TRUE)



