library(episcan)


### Name: epiHSIC1geno
### Title: Calculate epistasis using HSIC with one genotype input
### Aliases: epiHSIC1geno

### ** Examples

# simulate some data
set.seed(123)
geno1 <- matrix(sample(0:2, size = 1000, replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = 10)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), col = paste0("rs", 1:ncol(geno1)))
p2 <- rnorm(100, mean = 5, sd = 10)

# normalized data
geno1 <- scale(geno1)
p2 <- as.vector(unlist(scale(p2)))

# one genotypes with quantitative phenotype
epiHSIC1geno(geno = geno1,
pheno = p2, 
outfile = "episcan_1geno_quant", 
suffix = ".txt", 
zpthres = 0.9, 
chunk = 10)

# take a look at the result
res <- read.table("episcan_1geno_quant.txt", 
header = TRUE, 
stringsAsFactors = FALSE)
head(res)



