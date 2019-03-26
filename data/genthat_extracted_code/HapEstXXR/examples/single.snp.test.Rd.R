library(HapEstXXR)


### Name: single.snp.test
### Title: Regression analysis with single SNP genotypes as independent
###   variable
### Aliases: single.snp.test single.snp.test.binomial
###   single.snp.test.gaussian single.snp.test.families
###   single.snp.test.casecohort single.snp.test.casecohort.prentice
### Keywords: snp haplotypes logistic regression weigthed TDT survival
###   analysis

### ** Examples

N <- 2000
nloci <- 14
set.seed(1234)
y <- sample(c(0, 1), N, replace = TRUE)
snp <- matrix(sample(c(1, 2, 3), N * nloci, replace = TRUE), 
              ncol = nloci)
colnames(snp) <- paste("SNP", 1:nloci, sep = "")

adj.var <- matrix(rnorm(N * 3), ncol = 3)
colnames(adj.var) <- paste("A", 1:3, sep = "")

sst <- single.snp.test(snps = snp, trait = y, adj.var = adj.var,
    type = "binomial", prt = TRUE)



