library(RTextureMetrics)


### Name: calcCON
### Title: CON Contrast
### Aliases: calcCON
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data, nrow=4, byrow=TRUE)
(mat)
GLCM<-genGLCM(2,1,mat)
(GLCM)
(calcCON(GLCM))
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rawmat) 
{
    size <- dim(rawmat)[1]
    matconweights <- matrix(0, nrow = size, ncol = size)
    for (i in 1:size) {
        for (a in 1:size) {
            matconweights[i, a] <- (a - i)^2
        }
    }
    con <- rawmat * matconweights
    return(sum(con))
  }



