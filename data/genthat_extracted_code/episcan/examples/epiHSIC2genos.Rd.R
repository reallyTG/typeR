library(episcan)


### Name: epiHSIC2genos
### Title: Calculate epistasis using HSIC with two genotype inputs
### Aliases: epiHSIC2genos

### ** Examples

# simulate some data
set.seed(123)
n1 <- 10; n2 <- 15; rows <- 10
geno1 <- matrix(sample(0:2, size = n1*rows, replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = n1)
geno2 <- matrix(sample(0:2, size = n2*rows, replace = TRUE, prob = c(0.4, 0.3, 0.3)), ncol = n2)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), col = paste0("rs", 1:ncol(geno1)))
dimnames(geno2) <- list(row = paste0("IND", 1:nrow(geno2)), col = paste0("exm", 1:ncol(geno2)))
p2 <- rnorm(rows, mean = 5, sd = 10)

# normalized data
geno1 <- scale(geno1)
geno2 <- scale(geno2)
p2 <- as.vector(unlist(scale(p2)))

# two genotypes with quantitative phenotype
epiHSIC2genos(geno1 = geno1, 
geno2 = geno2, 
pheno = p2, 
outfile = "episcan_2geno_quant", 
suffix = ".txt", 
zpthres = 0.9, 
chunk = 10)

# take a look at the result
res <- read.table("episcan_2geno_quant.txt", 
header = TRUE, 
stringsAsFactors = FALSE)
head(res)



