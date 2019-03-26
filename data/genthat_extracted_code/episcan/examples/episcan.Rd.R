library(episcan)


### Name: episcan
### Title: Scan pairwise epistasis
### Aliases: episcan

### ** Examples

# simulate some data
set.seed(123)
geno1 <- matrix(sample(0:2, size = 1000, replace = TRUE, prob = c(0.5, 0.3, 0.2)), 
ncol = 10)
geno2 <- matrix(sample(0:2, size = 2000, replace = TRUE, prob = c(0.4, 0.3, 0.3)), 
ncol = 20)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), 
col = paste0("rs", 1:ncol(geno1)))
dimnames(geno2) <- list(row = paste0("IND", 1:nrow(geno2)), 
col = paste0("exm", 1:ncol(geno2)))
p1 <- c(rep(0, 60), rep(1, 40))
p2 <- rnorm(100)

# one genotype with case-control phenotype
episcan(geno1 = geno1, 
geno2 = NULL, 
pheno = p1, 
phetype = "case-control",
outfile = "episcan_1geno_cc", 
suffix = ".txt", 
zpthres = 0.9, 
chunksize = 10, 
scale = TRUE)

# take a look at the result
res <- read.table("episcan_1geno_cc.txt", 
header = TRUE, 
stringsAsFactors = FALSE)
head(res)

# two genotypes with quantitative phenotype
episcan(geno1 = geno1, 
geno2 = geno2, 
pheno = p2, 
phetype = "quantitative",
outfile = "episcan_2geno_quant", 
suffix = ".txt", 
zpthres = 0.9, 
chunksize = 10, 
scale = TRUE)



