library(tmvnsim)


### Name: tmvnsim
### Title: Truncated Multivariate Normal Simulation
### Aliases: tmvnsim

### ** Examples

low <- rep(1, 5)
high <- rep(2, 5)
sig <- matrix(0.1, 5, 5)
diag(sig) <- 1
res <- tmvnsim(nsamp=1000, k=5, lower=low, upper=high, imod=rep(TRUE, 5)
		, means=rep(0, 5), sigma=sig)
head(res$samp)
head(res$wts)
cat("Probability of the region:\n")
mean(res$wts)
cat("Mean of Z-bar conditonal on truncation region:\n")
sum(rowMeans(res$samp) * res$wts)/sum(res$wts)



