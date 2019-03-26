library(ACCLMA)


### Name: calcLMA
### Title: Calculates the appropriate LMA values for each observation
### Aliases: calcLMA
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
mydata<-calcLOI(mydata)
calcLMA(mydata)

## The function is currently defined as
function (mat) 
{
    n <- size(mat)
    for (i in 1:n) {
        mat[i, 7] = mat[i, 6] - mat[i, 5]
    }
    names(mat)[7] = "LMA"
    return(mat)
  }



