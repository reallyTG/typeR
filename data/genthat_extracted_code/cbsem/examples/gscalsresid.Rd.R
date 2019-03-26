library(cbsem)


### Name: gscalsresid
### Title: For use in clustergscairls, residuals of a gsc-model
### Aliases: gscalsresid

### ** Examples

data(simplemodel) 
data(gscalsout)
B <- matrix(c( 0,0,0, 0,0,0, 0.7,0.4,0),3,3,byrow=TRUE)
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)  
out <- gscalsresid(simplemodel,gscalsout,indicatorx,indicatory,TRUE,TRUE)




