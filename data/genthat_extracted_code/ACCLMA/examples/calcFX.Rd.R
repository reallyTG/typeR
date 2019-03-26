library(ACCLMA)


### Name: calcFX
### Title: Calculates the appropriate F(X) value of each observation
### Aliases: calcFX
### Keywords: ~kwd1 ~kwd2

### ** Examples

d <- c(1,1,3,4)
e <- c(5,6,7,8)
f <- c(1,1,1,1)
mydata <- data.frame(d,e,f)
names(mydata) <- c("X","Y","Weight")
mydata<-calcWeights(mydata)
mydata<-averageSameXs(mydata)
calcFX(mydata)

## The function is currently defined as
function (mat) 
{
    mat[1, 4] = mat[1, 3]
    n <- size(mat)
    for (i in 2:n) {
        mat[i, 4] = mat[i - 1, 4] + mat[i, 3]
    }
    names(mat)[4] <- "FX"
    return(mat)
  }



