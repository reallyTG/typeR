library(RTextureMetrics)


### Name: genGLCM
### Title: genGLCM (generate GLC-Matrix)
### Aliases: genGLCM
### Keywords: IO

### ** Examples

data<-c(0,0,1,1,0,0,1,1,0,2,2,2,2,2,3,3)
mat<-matrix(data,nrow=4, byrow=TRUE)
GLCM<-genGLCM(2,1,mat)
(GLCM)


## The function is currently defined as
function (direction, distance, rawmat) 
{
    number_coloums <- max(rawmat) + 1
    number_rows <- max(rawmat) + 1
    GLCM <- matrix(0, ncol = 255, nrow = 255)
    (GLCM)
    if (direction == 1) {
        for (i in 1:number_coloums - 1) {
            for (a in 1:number_rows) {
                GLCM[rawmat[a, i] + 1, rawmat[a, i + 1] + 1] <- GLCM[rawmat[a, 
                  i] + 1, rawmat[a, i + 1] + 1] + 1
            }
        }
    }
    if (direction == 2) {
        for (i in 1:number_coloums) {
            for (a in 1:number_rows - 1) {
                GLCM[rawmat[a, i] + 1, rawmat[a + 1, i] + 1] <- GLCM[rawmat[a, 
                  i] + 1, rawmat[a + 1, i] + 1] + 1
            }
        }
    }
    transGLCM <- t(GLCM)
    print("INVERTIERT")
    GLCM <- GLCM + transGLCM
    GLCMprob <- round(GLCM/sum(GLCM), digits = 4)
    return(GLCMprob)
  }



