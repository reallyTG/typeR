library(gtx)


### Name: multipheno.T2
### Title: Multi-phenotype test for association
### Aliases: multipheno.T2

### ** Examples

## Not run: 
##D nsubj <- 400 # number of subjects
##D nsnp <- 4000 # intended number of SNPs in GWAS
##D 
##D snps <- replicate(nsnp, rbinom(nsubj, 2, rbeta(1, 1.2, 1.2)))
##D ## simulate with random allele frequencies
##D snps <- snps[ , apply(snps, 2, var) > 0]
##D nsnp <- ncol(snps) # number after filtering monomorphic
##D 
##D beta <- matrix(rnorm(30, 0, 0.1), ncol = 3)
##D ## matrix of effects of 10 snps on 3 phenotypes
##D 
##D y1 <-  rnorm(nsubj)
##D y2 <- .1*y1 + rnorm(nsubj)
##D y3 <- .1*y1 + .3*y2 + rnorm(nsubj) # simulate correlated errors
##D y <- cbind(y1, y2, y3) + snps[ , 1:10] %*% beta
##D ## wlog the truely associated snps are 1:10
##D rm(y1, y2, y3)
##D 
##D astats <- function(ii) {
##D   with(list(snp = snps[ , ii]),
##D        c(coef(summary(lm(y[ , 1] ~ snp)))["snp", 3],
##D          coef(summary(lm(y[ , 2] ~ snp)))["snp", 3],
##D          coef(summary(lm(y[ , 3] ~ snp)))["snp", 3],
##D          summary(manova(y ~ snp))$stats["snp", 6]))
##D }
##D system.time(gwas <- t(sapply(1:nsnp, astats)))
##D ## columns 1-3 contain single phenotype Z statistics
##D ## column 4 contains manova P-value
##D pv <- multipheno.T2(gwas[ , 1:3])$pval
##D 
##D plot(-log10(gwas[ , 4]), -log10(pv), type = "n",
##D      xlab = "MANOVA -log10(P)", ylab = "Summary statistic -log10(P)", las = 1)
##D points(-log10(gwas[-(1:10), 4]), -log10(pv[-(1:10)]))
##D points(-log10(gwas[1:10, 4]), -log10(pv[1:10]), cex = 2, pch = 21, bg = "red")
##D legend("topleft", pch = c(1, 21), pt.cex = c(1, 2), pt.bg = c("white", "red"),
##D        legend = c("null SNPs", "associated SNPs"))
##D ## nb approximation gets better as nsnp becomes large, even with small nsubj
## End(Not run)



