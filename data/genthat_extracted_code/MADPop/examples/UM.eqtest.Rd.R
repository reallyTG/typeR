library(MADPop)


### Name: UM.eqtest
### Title: Equality tests for two multinomial samples
### Aliases: UM.eqtest

### ** Examples

# bootstrapped p-value calculation against equal genotype proportions
# in lakes Michipicoten and Simcoe

# contingency table
popId <- c("Michipicoten", "Simcoe")
ctab <- UM.suff(fish215[fish215$Lake %in% popId,])$tab
ctab

# MLE of probability vector
p.MLE <- colSums(ctab)/sum(ctab)
# sample sizes
N1 <- sum(ctab[1,]) # Michipicoten
N2 <- sum(ctab[2,]) # Simcoe

# bootstrapped test statistics (chi^2 and LRT)
T.boot <- UM.eqtest(N1 = N1, N2 = N2, p0 = p.MLE, nreps = 1e3)

# observed test statistics
T.obs <- c(chi2 = chi2.stat(ctab), LRT = LRT.stat(ctab))
# p-values
rowMeans(t(T.boot) > T.obs)



