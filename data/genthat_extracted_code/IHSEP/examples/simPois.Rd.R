library(IHSEP)


### Name: simPois
### Title: Simulate a Poisson process
### Aliases: simPois
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (int, cens = 1, int.M = optimize(int, c(0, cens), maximum = TRUE)$obj * 
    1.1, B = max(as.integer(sqrt(int.M * cens)), 10)) 
{
    tms <- rexp(as.integer(int.M * cens + 2 * sqrt(int.M * cens)), 
        rate = int.M)
    while (sum(tms) < cens) tms <- c(tms, rexp(B, rate = int.M))
    cumtms <- cumsum(tms)
    tms <- cumtms[cumtms <= cens]
    N <- length(tms)
    if (N == 0) 
        return(numeric(0))
    tms[as.logical(mapply(rbinom, n = 1, size = 1, prob = int(tms)/int.M))]
  }



