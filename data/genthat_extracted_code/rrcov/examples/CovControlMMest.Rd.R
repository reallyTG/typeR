library(rrcov)


### Name: CovControlMMest
### Title: Constructor function for objects of class "CovControlMMest"
### Aliases: CovControlMMest
### Keywords: classes robust multivariate

### ** Examples

   ## the following two statements are equivalent
    ctrl1 <- new("CovControlMMest", bdp=0.25)
    ctrl2 <- CovControlMMest(bdp=0.25)

    data(hbk)
    CovMMest(hbk, control=ctrl1)
    
    
    



