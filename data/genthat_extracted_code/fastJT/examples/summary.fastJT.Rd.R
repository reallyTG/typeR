library(fastJT)


### Name: summary.fastJT
### Title: Summarize Jonckheere-Terpstra Test Statistics and P-Values
### Aliases: summary.fastJT

### ** Examples

# Generate dummy data	
num_patient <- 100
num_marker 	<- 10
num_SNP     <- 500
set.seed(12345);
Mark <- matrix(rnorm(num_patient*num_marker), num_patient, num_marker)
Geno <- matrix(rbinom(num_patient*num_SNP, 2, 0.5), num_patient, num_SNP)
colnames(Mark) <- paste0("Mrk:",1:num_marker)
colnames(Geno) <- paste0("SNP:",1:num_SNP)

res <- fastJT(Y=Mark, X=Geno, outTopN=5)
summary(res, Y2Print=c("Mrk:1","Mrk:2"), X2Print=1:5, printP=FALSE)
summary(res, Y2Print=NA, X2Print=1:5, printP=FALSE)

res <- fastJT(Y=Mark, X=Geno, outTopN=NA)
summary(res, Y2Print=1:10, X2Print=1:10, printP=TRUE)
summary(res, Y2Print=c("Mrk:1","Mrk:2"), X2Print=c("SNP:1","SNP:2"), printP=TRUE) 

res <- fastJT(Y=Mark, X=Geno, outTopN=NA, standardized=FALSE)
summary(res, outTopN=10)



