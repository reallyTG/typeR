library(RTextureMetrics)


### Name: calcDIS
### Title: DIS Dissimilarity
### Aliases: calcDIS
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data, nrow=4, byrow=TRUE)
(mat)
GLCM<-genGLCM(2,1,mat)
(GLCM)
(calcDIS(GLCM))
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rawmat) 
{
    size <- dim(rawmat)[1]
    matconweights <- matrix(0, nrow = size, ncol = size)
    for (i in 1:size) {
        for (a in 1:size) {
            matconweights[i, a] <- abs(a - i)
        }
    }
    dis <- rawmat * matconweights
    return(sum(dis))
  }



