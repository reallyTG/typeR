library(widals)


### Name: Z.clean.up
### Title: Clean Data
### Aliases: Z.clean.up
### Keywords: ~kwd1 ~kwd2

### ** Examples


tau <- 10
n <- 7

Z <- matrix(1, tau, n)
Z[2,4] <- -Inf
Z[3,4] <- Inf
Z[4,4] <- NA
Z[5,4] <- log(-1)
Z

Z.clean.up(Z)





## The function is currently defined as
function (Z) 
{
    Z[Z == Inf | Z == -Inf] <- NA
    Z[is.na(Z) | is.nan(Z)] <- mean(Z, na.rm = TRUE)
    return(Z)
  }



