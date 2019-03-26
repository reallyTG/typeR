library(RTextureMetrics)


### Name: calcHOM
### Title: HOM Homogeinity
### Aliases: calcHOM
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data, nrow=4, byrow=TRUE)
(mat)
GLCM<-genGLCM(2,1,mat)
(GLCM)
(calcHOM(GLCM))
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rawmat) 
{
    size <- dim(rawmat)[1]
    mathomweights <- matrix(0, nrow = size, ncol = size)
    for (i in 1:size) {
        for (a in 1:size) {
            mathomweights[i, a] <- 1/(1 + (a - i)^2)
        }
    }
    hom <- rawmat * mathomweights
    return(sum(hom))
  }



