library(Rfit)


### Name: walsh
### Title: Walsh Averages
### Aliases: walsh

### ** Examples


median(walsh(rnorm(100)))  # Hodges-Lehmann estimate of location

## The function is currently defined as
function (x) 
{
    n <- length(x)
    w <- vector(n * (n + 1)/2, mode = "numeric")
    ind <- 0
    for (i in 1:n) {
        for (j in i:n) {
            ind <- ind + 1
            w[ind] <- 0.5 * (x[i] + x[j])
        }
    }
    return(w)
  }



