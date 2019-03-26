library(ACCLMA)


### Name: averageSameXs
### Title: Unifies all same X observations
### Aliases: averageSameXs
### Keywords: ~kwd1 ~kwd2

### ** Examples

d <- c(1,1,3,4)
e <- c(5,6,7,8)
f <- c(1,1,1,1)
mydata <- data.frame(d,e,f)
names(mydata) <- c("X","Y","Weight")
averageSameXs(mydata)

## The function is currently defined as
function (mat) 
{
    n <- size(mat)
    temp <- matrix(NA, nrow = n, ncol = 3)
    line <- 1
    i <- 1
    while (i <= n) {
        j <- i
        sumY <- 0
        sumWeights <- 0
        while (j <= n & mat[i, 1] == mat[j, 1]) {
            sumY <- sumY + mat[j, 2] * mat[j, 3]
            sumWeights <- sumWeights + mat[j, 3]
            j <- j + 1
        }
        temp[line, 1] <- mat[i, 1]
        temp[line, 2] <- sumY/sumWeights
        temp[line, 3] <- sumWeights
        line <- line + 1
        i <- j
    }
    temp <- as.data.frame(temp[1:(line - 1), ])
    names(temp)[1] = "X"
    names(temp)[2] = "Y"
    names(temp)[3] = "Weights"
    return(temp)
  }



