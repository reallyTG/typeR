library(episcan)


### Name: epiblaster2genos
### Title: Parallelized calculattion of the difference of correlation
###   coefficients and compute Z test with two genotype inputs
### Aliases: epiblaster2genos

### ** Examples

# simulate some data
set.seed(123)
geno1 <- matrix(sample(0:2, size = 1000, replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = 10)
geno2 <- matrix(sample(0:2, size = 2000, replace = TRUE, prob = c(0.4, 0.3, 0.3)), ncol = 20)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), col = paste0("rs", 1:ncol(geno1)))
dimnames(geno2) <- list(row = paste0("IND", 1:nrow(geno2)), col = paste0("exm", 1:ncol(geno2)))
p1 <- c(rep(0, 60), rep(1, 40))

# normalized data
geno1 <- scale(geno1)
geno2 <- scale(geno2)

# two genotypes with quantitative phenotype
epiblaster2genos(geno1 = geno1, 
geno2 = geno2, 
pheno = p1, outfile = "episcan_2geno_cc", 
suffix = ".txt", 
zpthres = 0.9, 
chunk = 10)

# take a look at the result
res <- read.table("episcan_2geno_cc.txt", 
header = TRUE, 
stringsAsFactors = FALSE)
head(res)



