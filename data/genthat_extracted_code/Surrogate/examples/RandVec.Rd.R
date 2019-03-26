library(Surrogate)


### Name: RandVec
### Title: Generate random vectors with a fixed sum
### Aliases: RandVec
### Keywords: RandVec

### ** Examples

# generate two vectors with 10 values ranging between 0 and 1
# where each vector sums to 1
# (uniform distribution over the whole n-cube)
Vectors <- RandVec(a=0, b=1, s=1, n=10, m=2)
sum(Vectors$RandVecOutput[,1])
sum(Vectors$RandVecOutput[,2])



