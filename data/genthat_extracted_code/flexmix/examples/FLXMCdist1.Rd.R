library(flexmix)


### Name: FLXMCdist1
### Title: FlexMix Clustering of Univariate Distributions
### Aliases: FLXMCdist1
### Keywords: cluster

### ** Examples

if (require("actuar")) {
    set.seed(123)
    y <- c(rexp(100, 10), rexp(100, 1))
    ex <- flexmix(y ~ 1, cluster = rep(1:2, each = 100), model = FLXMCdist1(dist = "exp"))    
    parameters(ex)
}



