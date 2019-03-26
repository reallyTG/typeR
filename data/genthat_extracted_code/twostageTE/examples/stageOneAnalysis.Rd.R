library(twostageTE)


### Name: stageOneAnalysis
### Title: Stage one analysis
### Aliases: stageOneAnalysis

### ** Examples

X=runif(25, 0,1)
Y=X^2+rnorm(n=length(X), sd=0.1)
oneStage_IR=stageOneAnalysis(X, Y, 0.25, type="IR-wald", 0.99)

## The function is currently defined as
function (explanatory, response, threshold, type = "IR-wald", 
    level = 0.99) 
{
    cl1 <- match.call(expand.dots = TRUE)
    if (type == "IR-wald") {
        CI = waldConfidenceInterval_ir_stageOne(explanatory, 
            response, threshold, level = level)
        return(structure(list(L1 = CI$lower, U1 = CI$upper, estimate = CI$estimate, 
            C_1 = CI$C_1, threshold = threshold, level = level, 
            X1 = explanatory, Y1 = response, X2 = NA, Y2 = NA, 
            L2 = NA, U2 = NA, call = cl1, sigmaSq = CI$sigmaSq, 
            deriv_d0 = CI$deriv_d0), class = "twostageTE"))
    }
    else if (type == "IR-likelihood") {
        CI = likelihoodConfidenceInterval(explanatory, response, 
            threshold, level = level)
        return(structure(list(L1 = CI$lower, U1 = CI$upper, estimate = CI$estimate, 
            threshold = threshold, level = level, X1 = explanatory, 
            Y1 = response, X2 = NA, Y2 = NA, L2 = NA, U2 = NA, 
            call = cl1, sigmaSq = CI$sigmaSq, deriv_d0 = CI$deriv_d0), 
            class = "twostageTE"))
    }
    else if (type == "SIR") {
        CI = waldConfidenceInterval_sir_stageOne(explanatory, 
            response, threshold, level = level)
        return(structure(list(L1 = CI$lower, U1 = CI$upper, estimate = CI$estimate, 
            threshold = threshold, level = level, X1 = explanatory, 
            Y1 = response, X2 = NA, Y2 = NA, L2 = NA, U2 = NA, 
            call = cl1, sigmaSq = CI$sigmaSq, deriv_d0 = CI$deriv_d0), 
            class = "twostageTE"))
    }
    else error("stageOneAnalysis: type should be either 'IR-wald',
        'IR-likelihood' or 'SIR'")
  }



