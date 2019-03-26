library(ACCLMA)


### Name: calcFY
### Title: Calculates the appropriate FY value of each observation
### Aliases: calcFY
### Keywords: ~kwd1 ~kwd2

### ** Examples

d <- c(1,1,3,4)
e <- c(5,6,7,8)
f <- c(1,1,1,1)
mydata <- data.frame(d,e,f)
names(mydata) <- c("X","Y","Weight")
mydata<-calcWeights(mydata)
mydata<-averageSameXs(mydata)
mydata<-calcFX(mydata)
calcFY(mydata)

## The function is currently defined as
function (mat) 
{
    mat[1, 5] = mat[1, 2] * mat[1, 3]
    n <- size(mat)
    for (i in 2:n) {
        mat[i, 5] = mat[i - 1, 5] + mat[i, 2] * mat[i, 3]
    }
    names(mat)[5] <- "FY"
    return(mat)
  }



