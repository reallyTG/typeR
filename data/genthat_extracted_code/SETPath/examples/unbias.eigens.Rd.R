library(SETPath)


### Name: unbias.eigens
### Title: Unbiased estimation of leading eigenvalues
### Aliases: unbias.eigens

### ** Examples


## The function is currently defined as
function (L, g, w, minalpha = NULL) 
{
    if (length(minalpha) == 0) {
        minalpha = sqrt(max(g))
    }
    a = c()
    for (k in 1:2) {
        if (L[k] < (1 + sqrt(g[k]))^2) {
            a[k] = 1 + sqrt(max(g)) + minalpha
        }
        if (L[k] >= (1 + sqrt(g[k]))^2) {
            a[k] = ((1 + L[k] - g[k]) + sqrt((1 + L[k] - g[k])^2 - 
                4 * L[k]))/2
        }
    }
    a0 = sum(a * w)
    a0 = max(c(a0, 1 + sqrt(g)))
    QLcorrection = (g[1] - g[2]) * a0/(a0 - 1)
    return(list(QLcorrection = QLcorrection, a0 = a0, a = a))
  }



