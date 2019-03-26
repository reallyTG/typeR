library(jtGWAS)


### Name: pvalues
### Title: Compute P-values Based on Jonckheere-Terpstra Test Statistics
### Aliases: pvalues

### ** Examples

# Generate dummy data	
num_patient <- 100
num_marker 	<- 10
num_SNP     <- 500
set.seed(12345)
X_pat_mak <- matrix(rnorm(num_patient*num_marker), num_patient, num_marker)
G_pat_SNP <- matrix(rbinom(num_patient*num_SNP, 2, 0.5), num_patient, num_SNP)
colnames(X_pat_mak) <- colnames(X_pat_mak, do.NULL=FALSE, prefix="Mrk:")
colnames(G_pat_SNP) <- colnames(G_pat_SNP, do.NULL=FALSE, prefix="SNP:")

res <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=5)
pvalues(res)
res <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=NA)
pvalues(res)



