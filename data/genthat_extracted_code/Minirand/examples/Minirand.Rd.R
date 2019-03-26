library(Minirand)


### Name: Minirand
### Title: Minimization randomization to k treatment groups
### Aliases: Minirand

### ** Examples

ntrt <- 3
nsample <- 120
trtseq <- c(1, 2, 3)
ratio <- c(2, 2, 1)
c1 <- sample(seq(1, 0), nsample, replace = TRUE, prob = c(0.4, 0.6)) 
c2 <- sample(seq(1, 0), nsample, replace = TRUE, prob = c(0.3, 0.7))
c3 <- sample(c(2, 1, 0), nsample, replace = TRUE, prob = c(0.33, 0.2, 0.5)) 
c4 <- sample(seq(1, 0), nsample, replace = TRUE, prob = c(0.33, 0.67)) 
covmat <- cbind(c1, c2, c3, c4) # generate the matrix of covariate factors for the subjects
# label of the covariates 
colnames(covmat) = c("Gender", "Age", "Hypertension", "Use of Antibiotics") 
covwt <- c(1/4, 1/4, 1/4, 1/4) #equal weights
res <- rep(100, nsample) # result is the treatment needed from minimization method
#gernerate treatment assignment for the 1st subject
res[1] = sample(trtseq, 1, replace = TRUE, prob = ratio/sum(ratio)) 
for (j in 2:nsample)
{
# get treatment assignment sequentiall for all subjects
res[j] <- Minirand(covmat=covmat, j, covwt=covwt, ratio=ratio, 
ntrt=ntrt, trtseq=trtseq, method="Range", result=res, p = 0.9)
}
trt1 <- res
#Display the number of randomized subjects at covariate factors
balance1 <- randbalance(trt1, covmat, ntrt, trtseq) 
balance1
totimbal(trt = trt1, covmat = covmat, covwt = covwt, 
ratio = ratio, ntrt = ntrt, trtseq = trtseq, method = "Range")



