library(intrinsicDimension)


### Name: tp
### Title: Dimension Estimation via Translated Poisson Distributions
### Aliases: maxLikGlobalDimEst maxLikPointwiseDimEst maxLikLocalDimEst
###   hill

### ** Examples

data <- hyperBall(100, d = 7, n = 13, sd = 0.01)
maxLikGlobalDimEst(data, 10, dnoiseNcChi, 0.01, 13)
maxLikGlobalDimEst(data, 10, dnoiseGaussH, 0.01, 13)
maxLikGlobalDimEst(data, 10, dnoiseGaussH, 0.01, 13)
maxLikGlobalDimEst(data, 10, dnoiseGaussH, 0.01, 13, neighborhood.aggregation = 'robust')
maxLikGlobalDimEst(data, 10, dnoiseGaussH, 0.01, 13,
        integral.approximation = 'guaranteed.convergence',
        neighborhood.aggregation = 'robust')
maxLikGlobalDimEst(data, 10, dnoiseGaussH, 0.01, 13,
        integral.approximation = 'iteration', unbiased = TRUE)

data <- hyperBall(1000, d = 7, n = 13, sd = 0.01)
maxLikGlobalDimEst(data, 500, dnoiseGaussH, 0.01, 13,
        neighborhood.based = FALSE)
maxLikGlobalDimEst(data, 500, dnoiseGaussH, 0.01, 13,
        integral.approximation = 'guaranteed.convergence',
        neighborhood.based = FALSE)
maxLikGlobalDimEst(data, 500, dnoiseGaussH, 0.01, 13,
        integral.approximation = 'iteration',
        neighborhood.based = FALSE)
        
data <- hyperBall(100, d = 7, n = 13, sd = 0.01)
maxLikPointwiseDimEst(data, 10, dnoiseNcChi, 0.01, 13, indices=1:10)

data <- cutHyperPlane(50, d = 7, n = 13, sd = 0.01)
maxLikLocalDimEst(data, dnoiseNcChi, 0.1, 3)
maxLikLocalDimEst(data, dnoiseGaussH, 0.1, 3)
maxLikLocalDimEst(data, dnoiseNcChi, 0.1, 3,
       integral.approximation = 'guaranteed.convergence')




