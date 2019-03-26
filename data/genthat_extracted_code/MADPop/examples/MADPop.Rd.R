library(MADPop)


### Name: MADPop
### Title: (M)HC (A)llele-Based (D)ifferencing between (Pop)ulations
### Aliases: MADPop MADPop-package

### ** Examples

# typical dataset
head(fish215[sample(nrow(fish215)),])
table(fish215$Lake) # number of samples per lake

# contingency table on two lakes
iLakes <- c("Michipicoten", "Simcoe")
Xsuff <- UM.suff(X = fish215[fish215$Lake %in% iLakes,])
ctab <- Xsuff$tab
ctab

# bootstrapped p-value calculation for chi^2 and LR tests
p.MLE <- colSums(ctab)/sum(ctab)
N1 <- sum(ctab[1,])
N2 <- sum(ctab[2,])
# bootstrapped test statistics (chi^2 and LRT)
T.boot <- UM.eqtest(N1 = N1, N2 = N2, p0 = p.MLE, nreps = 1e3)

# observed test statistics
T.obs <- c(chi2 = chi2.stat(ctab), LRT = LRT.stat(ctab))
# p-values
rowMeans(t(T.boot) > T.obs)

# posterior sampler for hierarchical model

# output posterior probability for each genotype in lake Simcoe
rhoId <- "Simcoe"
nsamples <- 500
hUM.fit <- hUM.post(nsamples = nsamples, X = fish215,
                    rhoId = rhoId, chains = 1)

# first 20 genotype posterior probabilities in lake Simcoe
rho.post <- hUM.fit$rho[,1,]
boxplot(rho.post[,1:20], las = 2,
        xlab = "Genotype", ylab = "Posterior Probability",
        pch = ".", col = "grey")



