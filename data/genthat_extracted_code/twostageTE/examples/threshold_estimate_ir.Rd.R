library(twostageTE)


### Name: threshold_estimate_ir
### Title: Threshold estimate based on IR
### Aliases: threshold_estimate_ir

### ** Examples

X=runif(25, 0,1)
Y=X^2+rnorm(n=length(X), sd=0.1)
stageOneAnalysis(X, Y, 0.25, type="IR-wald", 0.99)

## The function is currently defined as
function (explanatory, response, Y_0) 
{
    n = length(response)
    if (sum(response < Y_0) == n) {
        warning("Y_0 is outside observed region")
        list(threshold_estimate_explanatory = max(explanatory), 
            threshold_estimate_response = max(response), threshold = Y_0, 
            Y_hat = max(response), index = n)
    }
    else if (sum(response >= Y_0) == n) {
        warning("Y_0 is outside observed region")
        list(threshold_estimate_explanatory = min(explanatory), 
            threshold_estimate_response = min(response), threshold = Y_0, 
            Y_hat = min(response), index = 1)
    }
    else {
        fit = pava(explanatory, response)
        if (sum(fit$y >= Y_0) == 0) {
            warning("estimate is on the boundary")
            ind = n
            estim_x = fit$x[ind]
        }
        else if (sum(fit$y <= Y_0) == 0) {
            warning("estimate is on the boundary")
            ind = min(which(fit$y >= Y_0))
            estim_x = fit$x[ind]
        }
        else {
            ind = min(which(fit$y >= Y_0))
            estim_x = fit$x[ind]
        }
        list(threshold_estimate_explanatory = estim_x, 
            threshold_estimate_response = fit$y[ind], 
            threshold = Y_0, Y_hat = fit$y, index = ind)
    }
  }



