library(fastJT)


### Name: fastJT.select
### Title: Conduct k-Fold Cross-Validation based on Jonckheere-Terpstra
###   Test Statistics
### Aliases: fastJT.select

### ** Examples

# Generate dummy data	
num_sample  <- 100
num_marker  <- 10
num_feature <- 500
set.seed(12345)
Data <- matrix(rnorm(num_sample*num_marker), num_sample, num_marker)
Features <- matrix(rbinom(num_sample*num_feature, 2, 0.5), num_sample, num_feature)
colnames(Data) <- paste0("Var:",1:num_marker)
colnames(Features) <- paste0("Ftr:",1:num_feature)

res <- fastJT.select(Y=Data, X=Features, cvMesh=NULL, kFold=5, 
                     selCrit=NULL, outTopN=5, numThreads=1)
res 



