library(fastJT)


### Name: pvalues
### Title: Compute P-values Based on Jonckheere-Terpstra Test Statistics
### Aliases: pvalues

### ** Examples

# Generate dummy data	
num_patient <- 100
num_marker 	<- 10
num_SNP     <- 500
set.seed(12345)
Mark <- matrix(rnorm(num_patient*num_marker), num_patient, num_marker)
Geno <- matrix(rbinom(num_patient*num_SNP, 2, 0.5), num_patient, num_SNP)
colnames(Mark) <- paste0("Mrk:",1:num_marker)
colnames(Geno) <- paste0("SNP:",1:num_SNP)

res <- fastJT(Y=Mark, X=Geno, outTopN=5)
pvalues(res)
res <- fastJT(Y=Mark, X=Geno, outTopN=NA)
pvalues(res)



