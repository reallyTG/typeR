library(twostageTE)


### Name: estimateSigmaSq
### Title: Estimate Variance
### Aliases: estimateSigmaSq

### ** Examples

explanatory = runif(50)
response = explanatory^2 + rnorm(50, sd=0.1)
estimateSigmaSq(explanatory, response)

## The function is currently defined as
function (explanatory, response) 
{
    ind = order(explanatory, decreasing = FALSE)
    if (sum(diff(ind) < 0) != 0) {
        explanatory = explanatory[ind]
        response = response[ind]
    }
    n = length(response)
    a = b = eps = rep(0, n - 2)
    for (i in 2:(n - 1)) {
        x = explanatory[(i - 1):(i + 1)]
        a[i - 1] = (x[3] - x[2])/(x[3] - x[1])
        b[i - 1] = (x[2] - x[1])/(x[3] - x[1])
        eps[i - 1] = a[i - 1] * response[i - 1] + b[i - 1] * 
            response[i + 1] - response[i]
    }
    cSq = 1/(a^2 + b^2 + 1)
    list(sigmaSq = 1/(n - 2) * sum(cSq * eps^2), a = a, b = b, 
        eps = eps)
  }



