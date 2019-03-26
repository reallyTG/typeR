library(generalCorr)


### Name: cofactor
### Title: Compute cofactor of a matrix based on row r and column c.
### Aliases: cofactor

### ** Examples


## The function is currently defined as
function (x, r, c) 
{
    out = minor(x, r, c) * ((-1)^(r + c))
    return(out)
  }



