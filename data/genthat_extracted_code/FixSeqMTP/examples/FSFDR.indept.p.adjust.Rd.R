library(FixSeqMTP)


### Name: FSFDR.indept.p.adjust
### Title: Adjusted P-values for Fixed Sequence FDR Controlling Procedure
###   under Independence
### Aliases: FSFDR.indept.p.adjust

### ** Examples

## generate a pre-ordered pvalue vector for 50 hypotheses, where 80% are true nulls
set.seed(1234); m <- 50; pi0 <- 0.8; m0 <- m*pi0; m1 <- m-m0
mu <- c(4*0.9^(1:m1), rep(0,m0))
Zstat <- rnorm(n = m, mean = mu)
Pval <- 1-pnorm(Zstat)
## conventional fixed sequence procedure
FSFDR.indept.p.adjust(p = Pval, alpha = 0.05)
## generalized fixed sequence procedure allowing stop at 5th acceptance
FSFDR.indept.p.adjust(p = Pval, alpha = 0.05, k=5)



