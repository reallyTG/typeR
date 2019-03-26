library(twostageTE)


### Name: linearBootstrapConfidenceInterval_stageTwo
### Title: Confidence interval based on bootstrapping a local linear model
### Aliases: linearBootstrapConfidenceInterval_stageTwo

### ** Examples

X=runif(25, 0,1)
Y=X^2+rnorm(n=length(X), sd=0.1)
oneStage_IR=stageOneAnalysis(X, Y, 0.25, type="IR-wald", 0.99)
X2 = c(rep(oneStage_IR$L1,37),rep(oneStage_IR$U1,38))
Y2=X2^2+rnorm(n=length(X2), sd=0.1)
twoStage_IR_locLinear=likelihoodConfidenceInterval(X, Y, 0.25, 0.95)

## The function is currently defined as
function (explanatory, response, Y_0, level = NA) 
{
    numBootstrap = 1000
    if (is.na(level)) {
        level = 0.95
    }
    alpha = 1 - level
    n = length(response)
    fit = threshold_estimate_locLinear(explanatory, response, 
        Y_0)
    Rn = rep(0, numBootstrap)
    for (i in 1:numBootstrap) {
        ind = sample(x = n, replace = TRUE)
        fit_bst = threshold_estimate_locLinear(explanatory[ind], 
            response[ind], Y_0)
        Rn[i] = sqrt(n) * (fit_bst$threshold_estimate_explanatory - 
            fit$threshold_estimate_explanatory)
    }
    qU = quantile(Rn, alpha/2)
    qL = quantile(Rn, level + alpha/2)
    uBand = fit$threshold_estimate_explanatory - n^(-1/2) * qU
    lBand = fit$threshold_estimate_explanatory - n^(-1/2) * qL
    return(list(estimate = fit$threshold_estimate_explanatory, 
        lower = max(lBand, min(explanatory)), upper = min(uBand, 
            max(explanatory)), sigmaSq = NA, deriv_d0 = NA))
  }



