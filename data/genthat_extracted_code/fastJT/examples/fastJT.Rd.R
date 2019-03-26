library(fastJT)


### Name: fastJT
### Title: Compute the Jonckheere-Terpstra Test Statistics
### Aliases: fastJT

### ** Examples

# Generate dummy data	
num_sample <- 100
num_marker <- 10
num_SNP		 <- 500
set.seed(12345)
Mark <- matrix(rnorm(num_sample*num_marker), num_sample, num_marker)
Geno <- matrix(rbinom(num_sample*num_SNP, 2, 0.5), num_sample, num_SNP)
colnames(Mark) <- paste0("Mrk:",1:num_marker)
colnames(Geno) <- paste0("SNP:",1:num_SNP)

res <- fastJT(Y=Mark, X=Geno, outTopN=5)
res
res <- fastJT(Y=Mark, X=Geno, outTopN=NA)
head(res) 



