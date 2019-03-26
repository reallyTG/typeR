library(metRology)


### Name: buildCor
### Title: Functions to build correlation and covariance matrices.
### Aliases: buildCor buildCov updateCor updateCov
### Keywords: univar

### ** Examples

    
    #Duplicate correlation for example for uncert()
    buildCor(4, cors=c(3, 4, 0.5))
               
    
    #Multiple correlations
    r<-buildCor(3, cors=rbind( c(1,2,0.5), c(2,3,0.25) ) )
    r
    
    updateCor(r, cors=c(1,3,0.13)) #perhaps more realistic
    
    buildCov(1:3, cors=rbind( c(1,2,0.5), c(2,3,0.25),c(1,3,0.13) ) )
    



