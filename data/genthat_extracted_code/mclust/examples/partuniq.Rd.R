library(mclust)


### Name: partuniq
### Title: Classifies Data According to Unique Observations
### Aliases: partuniq
### Keywords: cluster

### ** Examples

set.seed(0)

mat <- data.frame(lets = sample(LETTERS[1:2],9,TRUE), nums = sample(1:2,9,TRUE))
mat

ans <- partuniq(mat)
ans

partconv(ans,consec=TRUE)



