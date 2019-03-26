library(FNN)


### Name: KL.dist
### Title: Kullback-Leibler Divergence
### Aliases: KL.dist KLx.dist
### Keywords: manip

### ** Examples

    set.seed(1000)
    X<- rexp(10000, rate=0.2)
    Y<- rexp(10000, rate=0.4)
    
    KL.dist(X, Y, k=5)                 
    KLx.dist(X, Y, k=5) 
    #thoretical distance = (0.2-0.4)^2/(0.2*0.4) = 0.5
    



