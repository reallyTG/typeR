library(ACCLMA)


### Name: calcLOI
### Title: Calculate the appropriate LOI value for each observation
### Aliases: calcLOI
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
mydata<-calcFY(mydata)
calcLOI(mydata)

## The function is currently defined as
function (mat) 
{
    n <- size(mat)
    for (i in 1:n) {
        mat[i, 6] = mat[i, 4] * mat[n, 5]
    }
    names(mat)[6] = "LOI"
    return(mat)
  }



