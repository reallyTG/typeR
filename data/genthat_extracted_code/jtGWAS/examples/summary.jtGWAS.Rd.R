library(jtGWAS)


### Name: summary.jtGWAS
### Title: Summarize Jonckheere-Terpstra Test Statistics and P-Values
### Aliases: summary.jtGWAS

### ** Examples

# Generate dummy data	
num_patient <- 100
num_marker 	<- 10
num_SNP     <- 500
set.seed(12345);
X_pat_mak <- matrix(rnorm(num_patient*num_marker), num_patient, num_marker)
G_pat_SNP <- matrix(rbinom(num_patient*num_SNP, 2, 0.5), num_patient, num_SNP)
colnames(X_pat_mak) <- colnames(X_pat_mak, do.NULL=FALSE, prefix="Mrk:")
colnames(G_pat_SNP) <- colnames(G_pat_SNP, do.NULL=FALSE, prefix="SNP:")

res <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=5)
summary(res, marker2Print=c("Mrk:1","Mrk:2"), SNP2Print=1:5, printP=FALSE)
summary(res, marker2Print=NA, SNP2Print=1:5, printP=FALSE)

res <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=NA)
summary(res, marker2Print=1:10, SNP2Print=1:10, printP=TRUE)
summary(res, marker2Print=c("Mrk:1","Mrk:2"), SNP2Print=c("SNP:1","SNP:2"), printP=TRUE) 

res <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=NA, standardized=FALSE)
summary(res, outTopN=10)



