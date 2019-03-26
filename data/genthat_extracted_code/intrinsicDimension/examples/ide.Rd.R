library(intrinsicDimension)


### Name: ide
### Title: Intrinsic Dimension Estimation
### Aliases: localIntrinsicDimension globalIntrinsicDimension
###   pointwiseIntrinsicDimension

### ** Examples

data <- hyperBall(100, 4, 15, .05)
localIntrinsicDimension(data, .method='essLocalDimEst', ver = 'a', d = 1)
globalIntrinsicDimension(data, 'dancoDimEst', k = 8, D = 20)
pointwiseIntrinsicDimension(data, .method='maxLikPointwiseDimEst', k = 8, dnoise = NULL)



