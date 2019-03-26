library(ACCLMA)


### Name: size
### Title: Counts the number of rows in a data set
### Aliases: size
### Keywords: ~kwd1 ~kwd2

### ** Examples

d <- c(1,1,3,4)
e <- c(5,6,7,8)
f <- c(1,1,1,1)
mydata <- data.frame(d,e,f)
names(mydata) <- c("X","Y","Weight")
size(mydata)

## The function is currently defined as
function (mat) 
{
    i <- 1
    while (!is.na(mat[i, 1]) & !is.null(mat[i, 1])) {
        i = i + 1
    }
    return(i - 1)
  }



