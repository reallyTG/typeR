library(ACCLMA)


### Name: calcWeights
### Title: Calculates the relative weight of each observation
### Aliases: calcWeights
### Keywords: ~kwd1 ~kwd2

### ** Examples

d <- c(1,1,3,4)
e <- c(5,6,7,8)
f <- c(1,1,1,1)
mydata <- data.frame(d,e,f)
names(mydata) <- c("X","Y","Weight")
mydata<-averageSameXs(mydata)
calcWeights(mydata)

## The function is currently defined as
function (mat) 
{
    n <- size(mat)
    zeroWeight <- 0
    sumWeight <- 0
    for (i in 1:n) {
        if (is.null(mat[i, 3]) || is.na(mat[i, 3]) || mat[i, 
            3] == 0) {
            zeroWeight <- 1
        }
        sumWeight <- sumWeight + mat[i, 3]
    }
    if (zeroWeight == 1) {
        mat[3] = 1/n
        return(mat)
    }
    for (i in 1:n) {
        mat[i, 3] <- mat[i, 3]/sumWeight
    }
    return(mat)
  }



