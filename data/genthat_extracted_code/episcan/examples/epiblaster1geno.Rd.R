library(episcan)


### Name: epiblaster1geno
### Title: Parallelized calculation of the difference of correlation
###   coefficients and compute Z test with one genotype input
### Aliases: epiblaster1geno

### ** Examples

# simulate some data
set.seed(123)
geno1 <- matrix(sample(0:2, size = 1000, replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = 10)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), col = paste0("rs", 1:ncol(geno1)))
p1 <- c(rep(0, 60), rep(1, 40))

# normalized data
geno1 <- scale(geno1)

# one genotype with case-control phenotype
epiblaster1geno(geno = geno1, 
pheno = p1,
outfile = "episcan_1geno_cc", 
suffix = ".txt", 
zpthres = 0.9, 
chunk = 10)

# take a look at the result
res <- read.table("episcan_1geno_cc.txt", 
header = TRUE, 
stringsAsFactors = FALSE)
head(res)



