library(twostageTE)


### Name: threshold_estimate_locLinear
### Title: Threshold estimate based on local linear approximation
### Aliases: threshold_estimate_locLinear

### ** Examples

X=runif(25, 0,1)
Y=X^2+rnorm(n=length(X), sd=0.1)
oneStage_IR=stageOneAnalysis(X, Y, 0.25, type="IR-wald", 0.99)
X2 = c(rep(oneStage_IR$L1,37),rep(oneStage_IR$U1,38))
Y2=X2^2+rnorm(n=length(X2), sd=0.1)
stageTwoAnalysis(oneStage_IR, explanatory = X2, response = Y2,
type = "locLinear", level = 0.95)


## The function is currently defined as
function (explanatory, response, Y_0) 
{
    n = length(response)
    if (sum(response < Y_0) == n) {
        list(threshold_estimate_explanatory = max(explanatory), 
            threshold_estimate_response = max(response), threshold = Y_0, 
            Y_hat = max(response), index = n)
    }
    else if (sum(response >= Y_0) == n) {
        list(threshold_estimate_explanatory = min(explanatory), 
            threshold_estimate_response = min(response), threshold = Y_0, 
            Y_hat = min(response), index = 1)
    }
    else {
        beta = lm(response ~ explanatory)$coef
        estim_x = (Y_0 - beta[1])/beta[2]
        list(threshold_estimate_explanatory = estim_x, threshold = Y_0)
    }
  }



