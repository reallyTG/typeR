library(RTextureMetrics)


### Name: calcENT
### Title: ENT Entropy
### Aliases: calcENT
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data, nrow=4, byrow=TRUE)
(mat)
GLCM<-genGLCM(2,1,mat)
(GLCM)
(calcENT(GLCM))
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rawmat) 
{
    lnrawmat <- log(rawmat)
    size <- dim(lnrawmat)[1]
    for (i in 1:size) {
        for (a in 1:size) {
            if (lnrawmat[a, i] == "-Inf") {
                lnrawmat[a, i] <- 0
            }
        }
    }
    return(sum(rawmat * lnrawmat))
  }



