library(FNN)


### Name: KL.divergence
### Title: Kullback-Leibler Divergence
### Aliases: KL.divergence KLx.divergence
### Keywords: manip

### ** Examples

    set.seed(1000)
    X<- rexp(10000, rate=0.2)
    Y<- rexp(10000, rate=0.4)

    KL.divergence(X, Y, k=5)
    #theoretical divergence = log(0.2/0.4)+(0.4-0.2)-1 = 1-log(2) = 0.307



